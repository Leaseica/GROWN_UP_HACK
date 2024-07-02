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
require "open-uri"

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
  { email: "jane.doe12@gmail.com", password: "123456", first_name: "Jane", last_name: "Doe", occupation: "Développeur", address: "1 rue premier", zip_code: "75001", birthday: "1990-01-01", country: "France", phone_number: "+330601020304", gender: "Femme", admin: false },
  { email: "user212@example.com", password: "123456", first_name: "John", last_name: "Doe", occupation: "Coach", address: "2 rue deuxieme", zip_code: "75002", birthday: "03/02/1997", country: "Angleterre", phone_number: "+330601020304", gender: "Homme",admin: false },
  { email: "user312@example.com", password: "123456", first_name: "Jeff", last_name: "Doe", occupation: "Développeur", address: "3 rue troisieme", zip_code: "75003", birthday: "1998-02-02", country: "France", phone_number: "+330601020304", gender: "Homme",admin: false }
]

users.each do |attrs|
  User.create!(attrs)
end

puts "Seeding Categories..."
# Seed Categories

categories = [
  { name: "Logement",
    description: "Découvre tous nos conseils pratiques pour gérer ton logement en toute sérénité. Que tu sois à la recherche de ton premier appartement, que tu veuilles optimiser ton espace ou réaliser des travaux de rénovation, nous avons les guides qu'il te faut pour chaque étape. Profite de nos astuces pour sécuriser ton chez-toi et réduire tes factures d'énergie.",
    photo: "categories/cat_housing.webp" },
  { name: "Administratif",
    description: "Simplifie tes démarches administratives avec nos guides clairs et précis. Apprends comment obtenir ta carte d'identité, faire une déclaration d'impôts en ligne, ou encore gérer un changement d'adresse. Nous t'aidons à naviguer dans les méandres de l'administration avec des conseils pratiques et des astuces pour gagner du temps.",
    photo: "categories/cat_admin.webp" },

  { name: "Travail",
    description: "Booste ta carrière avec nos conseils sur le monde du travail. Que tu cherches à rédiger un CV percutant, négocier ton salaire, ou évoluer professionnellement, nous avons les ressources pour t'accompagner. Découvre également comment gérer ton télétravail efficacement et obtenir un meilleur équilibre entre vie professionnelle et personnelle.",
    photo: "categories/cat_work.webp" },

  { name: "Santé",
    description: "Prends soin de ta santé avec nos conseils bien-être. De l'inscription à la sécurité sociale au choix d'une mutuelle santé, en passant par la gestion des rendez-vous médicaux en ligne, nous te guidons pour rester en pleine forme. Adopte de bonnes habitudes de vie et découvre comment composer une trousse de secours essentielle.",
    photo: "categories/cat_health.webp" },

  { name: "Finance",
    description: "Optimise tes finances personnelles avec nos astuces et conseils. Apprends comment ouvrir un compte bancaire, faire ta déclaration de revenus, ou épargner pour tes projets futurs. Nous te proposons des stratégies simples et efficaces pour gérer ton budget, rembourser tes dettes et investir intelligemment.",
    photo: "categories/cat_finance.webp" },

  { name: "Voiture",
    description: "Prends la route en toute confiance avec nos conseils pour gérer ta voiture. De l'achat d'un véhicule à l'entretien régulier, en passant par la souscription à une assurance auto, nous te fournissons les informations nécessaires pour une expérience de conduite sereine. Découvre aussi comment passer le contrôle technique et changer un pneu facilement.",
    photo: "categories/cat_car.webp" }
]


categories.each do |data|
  category = Category.find_or_create_by!(name: data[:name]) do |cat|
    cat.description = data[:description]
  end

  file_path = Rails.root.join("app/assets/images/#{data[:photo]}")
  if File.exist?(file_path)
    category.photo.attach(io: File.open(file_path), filename: data[:photo])
    category.save!
  else
    puts "File not found: #{file_path}"
  end
end


puts "Seeding SubCategories..."

# Seed SubCategories under 'Travail'
sub_categories = [
  { name: "Recherche d'emploi",
    description: "Décroche le job de tes rêves avec nos conseils pratiques et astuces pour réussir tes candidatures, rédiger un CV percutant, et briller en entretien d'embauche.",
    category: Category.find_by(name: "Travail"),
    photo: "subcategories/subcat_job_search.png" },

  { name: "Gestion de carrière",
    description: "Explore les voies de ta carrière avec nos guides sur l'évolution professionnelle, la gestion des compétences, et les opportunités de formation continue.",
    category: Category.find_by(name: "Travail"),
    photo: "subcategories/subcat_career_management.webp" },

  { name: "Droit du travail",
    description: "Parcoure les méandres du droit du travail et reste informé sur tes droits et obligations en tant que salarié, avec des conseils sur les contrats de travail, les congés, et plus encore.",
    category: Category.find_by(name: "Travail"),
    photo: "subcategories/subcat_labor_law.webp" },

  { name: "Formation",
    description: "Découvre un trésor d'informations sur les différentes options de formation pour développer tes compétences et booster ta carrière, que ce soit par le biais de cours en ligne, de certifications, ou de formations en présentiel.",
    category: Category.find_by(name: "Travail"),
    photo: "subcategories/subcat_formation.webp" },

  { name: "Se lancer à son compte",
    description: "Prépare-toi à l'aventure de ta vie avec nos conseils pour devenir freelance ou créer ton entreprise. Apprends comment démarrer, gérer tes finances, et développer ton activité.",
    category: Category.find_by(name: "Travail"),
    photo: "subcategories/subcat_freelance.webp" },

  { name: "Bien-être au travail",
    description: "Découvre l'importance vitale de l'équilibre entre vie professionnelle et personnelle, avec des astuces pour gérer le stress, améliorer ta productivité, et maintenir une bonne santé mentale au travail.",
    category: Category.find_by(name: "Travail"),
    photo: "subcategories/subcat_wellness.webp" }

]

sub_categories.each do |data|
  sub_category = SubCategory.find_or_create_by!(name: data[:name], category: data[:category]) do |sub_cat|
    sub_cat.description = data[:description]
  end

  file_path = Rails.root.join("app/assets/images/#{data[:photo]}")
  if File.exist?(file_path)
    sub_category.photo.attach(io: File.open(file_path), filename: data[:photo])
    sub_category.save!
  else
    puts "File not found: #{file_path}"
  end
end





puts "Seeding Articles..."
# Seed Articles
articles_data = [
  { title: "Les étapes essentielles pour devenir freelance",
    description: "Découvre les étapes clés...",
    sub_category: SubCategory.find_by(name: "Se lancer à son compte"),
    photo: "banner_fox_working.webp" },

  { title: "Stratégies de marketing pour les freelances",
    description: "Apprends à promouvoir ton activité...",
    sub_category: SubCategory.find_by(name: "Se lancer à son compte"),
    photo: "banner_fox_working.webp" },

  { title: "Gestion financière pour les freelances",
    description: "Maîtrise la gestion financière...",
    sub_category: SubCategory.find_by(name: "Se lancer à son compte"),
    photo: "banner_fox_working.webp" },

  { title: "Les outils indispensables pour les freelances",
    description: "Découvre les outils et logiciels...",
    sub_category: SubCategory.find_by(name: "Se lancer à son compte"),
    photo: "banner_fox_working.webp" },

  { title: "Conseils pour réussir en tant que freelance",
    description: "Conseils pratiques pour réussir...",
    sub_category: SubCategory.find_by(name: "Se lancer à son compte"),
    photo: "banner_fox_working.webp" },

  { title: "Réseautage efficace pour les freelances",
    description: "Apprends à développer ton réseau...",
    sub_category: SubCategory.find_by(name: "Se lancer à son compte"),
    photo: "banner_fox_working.webp" },
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
    {
      name: 'AFE',
      url: 'https://www.afecreation.fr/',
      logo: 'afe_logo.png',
      description: "Agence France Entrepreneur, lancée à l'initiative de l'État, vise à informer et à assister les entrepreneurs de tous horizons, quel que soit leur statut juridique. Son site internet, convivial et exhaustif, vous permettra d'accéder à un espace collaboratif entre les divers acteurs de l'entrepreneuriat en France.",
      photo: "afe.png"
    },
    {
      name: 'BGE',
      url: 'https://www.bge.asso.fr/',
      logo: 'bge_logo.png',
      description: "BGE Parif est un réseau d'appui aux entrepreneurs de la région Île-de-France. Cet organisme se donne pour mission de soutenir les petites entreprises lors de leur création, afin de leur permettre de se développer et de pérenniser.",
      photo: "bge.png"
    },
    {
      name: 'CCI',
      url: 'https://www.cci.fr/',
      logo: 'cci_logo.png',
      description: "CCI Paris vous accompagne dans le développement de votre projet de création d’entreprise grâce à une gamme de services et de conseils adaptés. Vous trouverez des informations essentielles pour la gestion quotidienne de votre auto-entreprise.",
      photo: "cci.png"

    },
    {
      name: 'BPI',
      url: 'https://www.bpifrance.fr/',
      logo: 'bpi_logo.png',
      description: "BPI France vous accompagne grâce à une aide dans la gestion de votre entreprise. Vous trouverez des informations sur les financements, les garanties et les assurances pour vous aider à développer votre activité.",
      photo: "bpi.png"
    },
    {
      name: 'Station F',
      url: 'https://stationf.co/',
      logo: 'stationf_logo.png',
      description: "Station F est le plus grand campus de start-up au monde. Il propose un écosystème complet pour les entrepreneurs, avec des programmes d'accompagnement, des événements et des ressources pour vous aider à lancer et à développer votre entreprise.",
      photo: "stationf.png"
    },
    {
      name: 'Crème de la crème',
      url: 'https://cremedelacreme.io/',
      logo: 'cremedelacreme_logo.png',
      description: "Crème de la crème est une plateforme qui met en relation des entreprises avec des freelances experts du digital pour des missions diverses. Crème de la crème se démarque par son processus de sélection rigoureux des freelances, garantissant la qualité des profils proposés aux entreprises, ainsi que par son approche centrée sur les compétences et l'expertise des freelances.",
      photo: "cremedelacreme.jpg"

    },
    {
      name: 'Malt',
      url: 'https://www.malt.fr/',
      logo: 'malt_logo.png',
      description: "Malt offre un large réseau de freelances qualifiés dans divers secteurs, offrant aux entreprises un accès à une variété d'experts pour leurs projets. Ce qui distingue Malt, c'est ses outils de gestion de projet intégrés qui facilitent le travail indépendant et la réalisation de projets professionnels de haute qualité. Les freelances bénéficient également d'une visibilité accrue grâce à une plateforme bien établie, ce qui leur permet de trouver plus facilement des opportunités de collaboration avec des entreprises de toutes tailles. Ils proposent aussi des outils en ligne facilitant les tâches administratives.",
      photo: "malt.jpg"
    },
    {
      name: 'Comeup',
      url: 'https://www.comeup.com/',
      logo: 'comeup_logo.png',
      description: "Comeup est une plateforme innovante qui vise à connecter les entreprises avec des talents émergents et créatifs. Contrairement aux plateformes traditionnelles, Comeup se concentre sur la découverte de nouveaux talents et sur la mise en valeur de leur créativité. Les entreprises peuvent découvrir et collaborer avec des freelances talentueux qui apportent une touche unique à leurs projets. Avec une approche axée sur l'exploration et la diversité des talents, Comeup offre une expérience de mise en relation dynamique et stimulante pour les entreprises à la recherche de nouvelles perspectives créatives.",
      photo: "comeup.jpg"
    },
    {
      name: 'Upwork',
      url: 'https://www.upwork.com/',
      logo: 'upwork_logo.png',
      description: "Upwork est une plateforme en ligne qui met en relation des freelances et des entreprises du monde entier pour des projets de toutes tailles. Avec une vaste gamme de catégories, notamment le développement web, le design, la rédaction, le marketing et bien plus encore, Upwork offre aux entreprises un accès à un pool mondial de talents. Les freelances peuvent trouver des opportunités de travail variées et collaborer avec des clients internationaux, ce qui en fait une plateforme idéale pour ceux qui recherchent de la flexibilité et des opportunités d'expansion.",
      photo: "upwork.jpeg"
    }
  ]



platforms.each do |plat|
  platform = Platform.find_or_create_by!(name: plat[:name]) do |p|
    p.url = plat[:url]
    p.logo = plat[:logo]
    p.description = plat[:description]
  end

  file_path = Rails.root.join("app/assets/images/#{plat[:photo]}")
  if File.exist?(file_path)
    platform.photo.attach(io: File.open(file_path), filename: plat[:photo])
    platform.save!
  else
    puts "File not found: #{file_path}"
  end
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
    title: "Guide pour devenir freelance",
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
    title: "Guide pour les freelances",
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
