# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data

# MyGuide.destroy_all
# ArticlesPlatform.destroy_all
# Article.destroy_all
# SubCategory.destroy_all
# Platform.destroy_all
# Category.destroy_all
# User.destroy_all

# db/seeds.rb

# Environment specific data clearing to prevent accidental data deletion in production
if Rails.env.development? || Rails.env.test?
  puts "Clearing existing data..."
  MyGuide.destroy_all
  ArticlesPlatform.destroy_all
  Article.destroy_all
  SubCategory.destroy_all
  Platform.destroy_all
  Category.destroy_all
  User.destroy_all
end

puts "Seeding Users..."
# Seed Users
users = [
  { email: "jane.doe1@gmail.com", password: "123456", first_name: "Jane", last_name: "Doe", occupation: "Développeur", address: "1 rue premier", zip_code: "75001", birthday: "1990-01-01", country: "France", phone_number: "+330601020304", gender: "Femme", admin: true },
  { email: "user21@example.com", password: "123456", first_name: "John", last_name: "Doe", occupation: "Coach", address: "2 rue deuxieme", zip_code: "75002", birthday: "03/02/1997", country: "Angleterre", phone_number: "+330601020304", gender: "Homme" },
  { email: "user31@example.com", password: "123456", first_name: "Jeff", last_name: "Doe", occupation: "Développeur", address: "3 rue troisieme", zip_code: "75003", birthday: "1998-02-02", country: "France", phone_number: "+330601020304", gender: "Homme" }
]

users.each do |attrs|
  User.create!(attrs)
end

puts "Seeding Categories..."
# Seed Categories
categories_data = {
  "Logement" => "Description for Logement...",
  "Administratif" => "Description for Administratif...",
  "Travail" => "Description for Travail...",
  "Santé" => "Description for Santé...",
  "Finance" => "Description for Finance...",
  "Voiture" => "Description for Voiture..."
}
categories = categories_data.map do |name, description|
  Category.find_or_create_by!(name: name) { |category| category.description = description }
end

puts "Seeding SubCategories..."

# Seed SubCategories under 'Travail'
sub_categories_data = {
  "Recherche d'emploi" => ["Décroche le job de tes rêves...", categories[2]],
  "Gestion de carrière" => ["Explore les voies de ta carrière...", categories[2]],
  "Droit du travail" => ["Parcoure les méandres du droit du travail...", categories[2]],
  "Formation" => ["Découvre un trésor d'informations...", categories[2]],
  "Se lancer à son compte" => ["Prépare-toi à l'aventure de ta vie...", categories[2]],
  "Bien être au travail" => ["Découvre l'importance vitale de l'équilibre...", categories[2]]
}
sub_categories = sub_categories_data.map do |name, data|
  SubCategory.find_or_create_by!(name: name, category: data[1]) { |sub_cat| sub_cat.description = data[0] }
end


puts "Seeding Articles..."
# Seed Articles
articles_data = [
  { title: "Les étapes essentielles pour devenir freelance", description: "Découvre les étapes clés...", sub_category: sub_categories[4], photo: "etapes.jpg" },
  { title: "Stratégies de marketing pour les freelances", description: "Apprends à promouvoir ton activité...", sub_category: sub_categories[4], photo: "marketing_article.jpg" },
  { title: "Gestion financière pour les freelances", description: "Maîtrise la gestion financière...", sub_category: sub_categories[4], photo: "finance_article.jpg" },
  { title: "Les outils indispensables pour les freelances", description: "Découvre les outils et logiciels...", sub_category: sub_categories[4], photo: "photo_freelance_article.jpg" },
  { title: "Conseils pour réussir en tant que freelance", description: "Conseils pratiques pour réussir...", sub_category: sub_categories[4], photo: "reussir.jpg" },
  { title: "Réseautage efficace pour les freelances", description: "Apprends à développer ton réseau...", sub_category: sub_categories[4], photo: "reseau.jpg" },
]

articles_data.each do |data|
  article = Article.find_or_create_by!(title: data[:title], sub_category: data[:sub_category]) do |art|
    art.description = data[:description]
  end

  file_path = Rails.root.join("app/assets/images/#{data[:photo]}")
  if File.exist?(file_path)
    article.photo.attach(io: File.open(file_path), filename: data[:photo])
    article.save!
  else
    puts "File not found: #{file_path}"
  end
end


puts "Seeding Platforms..."
# Seed Platforms
platforms = [
  { name: "GitHub", url: "https://github.com", logo: "github_logo.png", description: "Where the world builds software." },
  { name: "Medium", url: "https://medium.com", logo: "medium_logo.png", description: "Read, write and share stories that matter." }
]
platforms.each do |plat|
  Platform.find_or_create_by!(name: plat[:name]).update!(plat)
end

puts "Seeding MyGuides..."

# Ensure some articles and users are already created
user1 = User.first
user2 = User.second
article1 = Article.find_by(title: "Les étapes essentielles pour devenir freelance")
article2 = Article.find_by(title: "Stratégies de marketing pour les freelances")

# Create MyGuides
my_guides = [
  {
    article: article1,
    user: user1,
    business_structure: "Entrepreneur individuel",
    is_micro_entrepreneur: true,
    is_business_extension: false,
    has_previous_self_employment: false,
    representative_role: "Indivisaire",
    representative_type: "Personne physique"
  },
  {
    article: article2,
    user: user2,
    business_structure: "Personne morale",
    is_micro_entrepreneur: false,
    is_business_extension: true,
    has_previous_self_employment: true,
    representative_role: "Personne ayant le pouvoir d'engager l'établissement",
    representative_type: "Personne morale"
  }
]

my_guides.each do |guide_attrs|
  MyGuide.find_or_create_by!(article: guide_attrs[:article], user: guide_attrs[:user]) do |guide|
    guide.update!(guide_attrs)
  end
end


puts "Seeding complete!"

puts "Users: #{User.count}"
puts "Categories: #{Category.count}"
puts "SubCategories: #{SubCategory.count}"
puts "Articles: #{Article.count}"
puts "Platforms: #{Platform.count}"
