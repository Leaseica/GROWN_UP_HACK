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

MyGuide.destroy_all
ArticlesPlatform.destroy_all
Article.destroy_all
SubCategory.destroy_all
Platform.destroy_all
Category.destroy_all
User.destroy_all

# Seed Users
user_1 = User.create(email: "user1@example.com", password: "123456", first_name: "John", last_name: "Doe", occupation: "Developer", address: "1 rue premier", birthday: "1990-01-01", nationality: "Française", social_security: "123-45-6789")
user_2 = User.create(email: "user2@example.com", password: "123456", first_name: "Jane", last_name: "Doe", occupation: "Coach", address: "2 rue deuxieme", birthday: "1997-03-03", nationality: "Anglaise", social_security: "987-65-4321")
user_3 = User.create(email: "user3@example.com", password: "123456", first_name: "Jeff", last_name: "Doe", occupation: "Developer", address: "3 rue troisieme", birthday: "1998-02-02", nationality: "Française", social_security: "111-11-1111")

# Seed Categories
logement = Category.create(name: "Logement", description: "Découvrez notre section 'Logement', votre allié pour surmonter les embûches de la vie domestique. Des fuites d'eau inattendues aux pertes de clés désagréables, en passant par les litiges avec les propriétaires et les questions sur la taxe foncière, notre application est là pour vous fournir des conseils pratiques, des solutions rapides et des réponses claires à toutes vos préoccupations. Ne laissez plus les problèmes de logement vous prendre au dépourvu, trouvez les réponses dont vous avez besoin ici.")
administratif = Category.create(name: "Administratif", description: "Plongez dans notre section 'Administratif', votre guide essentiel pour naviguer dans les méandres bureaucratiques en toute confiance. Que ce soit pour comprendre les démarches pour obtenir une carte d'identité, résoudre des litiges fiscaux ou déchiffrer des documents officiels complexes, notre application est là pour simplifier vos démarches administratives. Trouvez des conseils clairs, des réponses rapides et des astuces pratiques pour résoudre vos problèmes administratifs sans tracas.")
travail = Category.create(name: "Travail", description: "'Travail', votre compagnon indispensable pour surmonter les défis professionnels. Des questions sur vos droits au travail aux conseils pour gérer le stress professionnel, en passant par les stratégies pour réussir un entretien d'embauche et négocier votre salaire, notre application est votre alliée pour une carrière épanouissante. Avec des ressources pratiques, des conseils d'experts et des réponses à vos interrogations les plus urgentes, prenez en main votre réussite professionnelle dès aujourd'hui.")
santé = Category.create(name: "Travail", description: "Explorez notre section 'Santé', votre guide pratique pour naviguer dans les formalités administratives médicales en toute simplicité. Que ce soit pour commander une carte vitale, comprendre les remboursements médicaux ou savoir comment choisir une mutuelle adaptée, notre application vous offre des conseils clairs et des instructions étape par étape pour simplifier vos démarches. Avec des informations fiables, des astuces pratiques et des réponses à vos questions les plus fréquentes, prenez le contrôle de votre santé administrative dès aujourd'hui.")
finance = Category.create(name: "Travail", description: "Découvrez notre section 'Finance', votre compagnon indispensable pour gérer efficacement vos finances au quotidien. Que ce soit pour ouvrir un compte bancaire, comprendre les différents types d'investissements, optimiser votre budget familial ou obtenir des conseils sur la gestion des dettes, notre application vous offre des ressources claires et des outils pratiques pour vous aider à prendre des décisions financières éclairées. Avec des conseils d'experts, des astuces pour économiser et des réponses à vos questions financières les plus pressantes, prenez en main votre avenir financier dès maintenant.")
voiture = Category.create(name: "Voiture", description: "Explorez notre section 'Voiture', votre guide fiable pour résoudre les tracas de l'automobile. Que ce soit pour faire face à une panne inattendue, comprendre les formalités administratives liées à votre véhicule ou obtenir des conseils pour économiser sur l'entretien, notre application est là pour vous aider à prendre la route en toute confiance. Avec des conseils pratiques, des informations utiles et des solutions rapides, gardez votre voiture sur la bonne voie sans tracas.")
# Seed SubCategories
web_dev = SubCategory.create(name: "Web Development", description: "Developing websites", category: logement)
health_fitness = SubCategory.create(name: "Health & Fitness", description: "Health and fitness advice", category: travail)

# Seed Articles
article1 = Article.create(title: "Learn Rails", description: "A comprehensive guide to learning Ruby on Rails.", sub_category: web_dev, paragraph1: "Rails is a powerful framework...")
article2 = Article.create(title: "Yoga for Beginners", description: "Start your yoga journey today.", sub_category: health_fitness, paragraph1: "Yoga is a way to flexibility...")

# Seed Platforms
platform1 = Platform.create(name: "GitHub", url: "https://github.com", logo: "github_logo.png", description: "Where the world builds software.")
platform2 = Platform.create(name: "Medium", url: "https://medium.com", logo: "medium_logo.png", description: "Read, write and share stories that matter.")

# Seed ArticlesPlatforms Join Table
ArticlesPlatform.create(article: article1, platform: platform1)
ArticlesPlatform.create(article: article2, platform: platform2)

# Seed MyGuides
MyGuide.create!(
  article: article1,
  user: user_1,
  occupation: "Web Developer",
  address: "123 Main St, Cityville",
  social_security: "123-45-6789",
  business_structure: "Entrepreneur individuel",
  is_micro_entrepreneur: true,
  is_business_extension: false,
  has_previous_self_employment: false,
  representative_role: "Indivisaire",
  representative_type: "Personne physique"
)

MyGuide.create!(
  article: article2,
  user: user_2,
  occupation: "Graphic Designer",
  address: "456 Elm St, Townville",
  social_security: "987-65-4321",
  business_structure: "Personne Morale",
  is_micro_entrepreneur: false,
  is_business_extension: true,
  has_previous_self_employment: true,
  representative_role: "Personne ayant le pouvoir d'engager l'établissement",
  representative_type: "Personne morale"
)

MyGuide.create!(
  article: article1,
  user: user_3,
  occupation: "Journaliste freelance",
  address: "789 Oak St, Villageville",
  social_security: "321-54-9876",
  business_structure: "Entrepreneur individuel",
  is_micro_entrepreneur: true,
  is_business_extension: false,
  has_previous_self_employment: true,
  representative_role: "Indivisaire",
  representative_type: "Personne physique"
)

puts "Seed data loaded successfully!"
