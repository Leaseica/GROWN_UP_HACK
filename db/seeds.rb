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
user_1 = User.create(email: "jane.doe@gmail.com", password: "123456", first_name: "Jane", last_name: "Doe", occupation: "Développeur", address: "1 rue premier", birthday: "1990-01-01", nationality: "Française", social_security: "123-45-6789", gender: "Femme")
user_2 = User.create(email: "user2@example.com", password: "123456", first_name: "John", last_name: "Doe", occupation: "Coach", address: "2 rue deuxieme", birthday: "1997-03-03", nationality: "Anglaise", social_security: "987-65-4321", gender: "Homme")
user_3 = User.create(email: "user3@example.com", password: "123456", first_name: "Jeff", last_name: "Doe", occupation: "Développeur", address: "3 rue troisieme", birthday: "1998-02-02", nationality: "Française", social_security: "111-11-1111", gender: "Homme")
# Seed Categories
logement = Category.create(name: "Logement", description: "Découvres notre section 'Logement', ton allié pour surmonter les embûches de la vie domestique. Des fuites d'eau inattendues aux pertes de clés désagréables, en passant par les litiges avec les propriétaires et les questions sur la taxe foncière, notre application est là pour te fournir des conseils pratiques, des solutions rapides et des réponses claires à toutes tes préoccupations. Ne laisses plus les problèmes de logement te prendre au dépourvu, trouves les réponses dont tu as besoin ici.")
administratif = Category.create(name: "Administratif", description: "Plonges dans notre section 'Administratif', ton guide essentiel pour naviguer dans les méandres bureaucratiques en toute confiance. Que ce soit pour comprendre les démarches pour obtenir une carte d'identité, résoudre des litiges fiscaux ou déchiffrer des documents officiels complexes, notre application est là pour simplifier tes démarches administratives. Trouves des conseils clairs, des réponses rapides et des astuces pratiques pour résoudre tes problèmes administratifs sans tracas.")
travail = Category.create(name: "Travail", description: "Notre section 'Travail' est ton compagnon indispensable pour surmonter les défis professionnels. Des questions sur tes droits au travail aux conseils pour gérer le stress professionnel, en passant par les stratégies pour réussir un entretien d'embauche et négocier ton salaire, notre application est ton alliée pour une carrière épanouissante. Avec des ressources pratiques, des conseils d'experts et des réponses à tes interrogations les plus urgentes, prends en main ta réussite professionnelle dès aujourd'hui.")
santé = Category.create(name: "Santé", description: "Explores notre section 'Santé', ton guide pratique pour naviguer dans les formalités administratives médicales en toute simplicité. Que ce soit pour commander une carte vitale, comprendre les remboursements médicaux ou savoir comment choisir une mutuelle adaptée, notre application t'offre des conseils clairs et des instructions étape par étape pour simplifier tes démarches. Avec des informations fiables, des astuces pratiques et des réponses à tes questions les plus fréquentes, prends le contrôle de ta santé administrative dès aujourd'hui.")
finance = Category.create(name: "Finance", description: "Découvres notre section 'Finance', ton compagnon indispensable pour gérer efficacement tes finances au quotidien. Que ce soit pour ouvrir un compte bancaire, comprendre les différents types d'investissements, optimiser ton budget familial ou obtenir des conseils sur la gestion des dettes, notre application t'offre des ressources claires et des outils pratiques pour t'aider à prendre des décisions financières éclairées. Avec des conseils d'experts, des astuces pour économiser et des réponses à tes questions financières les plus pressantes, prends en main ton avenir financier dès maintenant.")
voiture = Category.create(name: "Voiture", description: "Explores notre section 'Voiture', ton guide fiable pour résoudre les tracas de l'automobile. Que ce soit pour faire face à une panne inattendue, comprendre les formalités administratives liées à ton véhicule ou obtenir des conseils pour économiser sur l'entretien, notre application est là pour t'aider à prendre la route en toute confiance. Avec des conseils pratiques, des informations utiles et des solutions rapides, gardes ta voiture sur la bonne voie sans tracas.")
# Seed SubCategories
recherche_emploi = SubCategory.create(name: "Recherche d'emploi", description:
  "Décroche le job de tes rêves en transformant ton CV en une invitation à l'aventure professionnelle et ta lettre de motivation en un coup de génie qui séduira même les dragons des ressources humaines, tandis que tu navigues avec aisance sur les mers tumultueuses des plateformes d'emploi et brille lors des entretiens comme une étoile montante du réseautage professionnel !", category: travail)
gestion_de_carrière = SubCategory.create(name: "Gestion de carrière", description:
"Explore les voies de ta carrière avec assurance et navigue avec brio à travers les méandres du monde professionnel, tout en cultivant ta croissance comme un jardinier expert de ton propre destin.", category: travail)
droit_du_travail = SubCategory.create(name: "Droit du travail", description:
  "Parcoure les méandres du droit du travail avec assurance, transformant chaque défi en une opportunité de croissance professionnelle pour naviguer avec succès dans le paysage complexe des relations professionnelles, te permettant ainsi de défendre tes droits et de prospérer dans ta carrière.", category: travail)
formation = SubCategory.create(name: "Formation", description:
  "Découvre un trésor d'informations sur tes droits à la formation, le fonctionnement du CPF et les différentes options de financement pour naviguer en toute confiance dans le monde de la formation professionnelle, et libére votre potentiel pour façonner ton avenir avec assurance et succès.", category:travail )
freelance = SubCategory.create(name: "Se lancer à son compte", description:
  "Prépare-toi à l'aventure de ta vie en découvrant comment te lancer à ton compte. Trouve des conseils pratiques, des astuces et des ressources essentielles pour démarrer ton entreprise, développer ta marque et conquérir le marché. Nos guides détaillés et articles inspirants t'accompagneront à chaque étape de ton parcours entrepreneurial, te permettant de concrétiser tes rêves et de tracer ta propre voie vers le succès.", category: travail )
bien_etre_au_travail = SubCategory.create(name: "Bien être au travail", description: "Découvre l'importance vitale de l'équilibre entre travail et vie personnelle. Tu y trouveras des astuces pratiques pour gérer ton stress et cultiver une santé mentale épanouie. De plus, plonge dans les politiques de santé et sécurité en entreprise pour te sentir plus confiant dans ton environnement professionnel, tout en prenant soin de toi.", category: travail )

  # Seed Articles
article1 = Article.create(
  title: "Les étapes essentielles pour devenir freelance",
  description: "Découvre les étapes clés pour démarrer ta carrière en tant que freelance.",
  sub_category: freelance,
  paragraph1: "De la définition de tes services à la recherche de clients, apprenez les étapes essentielles pour lancer votre activité de freelance et réussir dans ce domaine compétitif.",
)
article1.photo.attach(io: File.open("app/assets/images/etapes.jpg"), filename: "etapes.jpg")
article1.save!

article2 = Article.create(
  title: "Stratégies de marketing pour les freelances",
  description: "Apprends à promouvoir ton activité de freelance et à attirer des clients.",
  sub_category: freelance,
  paragraph1: "Explorez des stratégies de marketing efficaces pour vous démarquer en tant que freelance, attirer des clients potentiels et développer votre entreprise.",
)

article2.photo.attach(io: File.open("app/assets/images/marketing_article.jpg"), filename: "marketing_article.jpg")
article2.save!

article3 = Article.create(
  title: "Gestion financière pour les freelances",
  description: "Maîtrise la gestion financière pour assurer le succès de ton activité de freelance.",
  sub_category: freelance,
  paragraph1: "Apprenez à gérer vos finances en tant que freelance, y compris la tarification de vos services, la facturation des clients, la gestion des taxes et la planification financière à long terme.",
)
article3.photo.attach(io: File.open("app/assets/images/finance_article.jpg"), filename: "finance_article.jpg")
article3.save!

article4 = Article.create(
  title: "Les outils indispensables pour les freelances",
  description:
  "Découvre les outils et logiciels essentiels pour gérer ton activité de freelance.",
  sub_category: freelance,
  paragraph1: "Explorez une liste d'outils et de logiciels indispensables pour les freelances, allant de la gestion de projet à la comptabilité en passant par la collaboration en ligne, pour optimiser votre productivité et votre efficacité professionnelle."
)
article4.photo.attach(io: File.open("app/assets/images/photo_freelance_article.jpg"), filename: "photo_freelance_article.jpg")
article4.save!

article5 = Article.create(
  title: "Conseils pour réussir en tant que freelance",
  description: "Conseils pratiques pour réussir dans votre carrière de freelance.",
  sub_category: freelance,
  paragraph1: "Recevez des conseils éprouvés pour réussir en tant que freelance, y compris la gestion du temps, la communication avec les clients, le développement de compétences et la croissance professionnelle continue.",
)
article5.photo.attach(io: File.open("app/assets/images/reussir.jpg"), filename: "reussir.jpg")
article5.save!

article6 = Article.create(
  title: "Réseautage efficace pour les freelances",
  description: "Apprends à développer ton réseau professionnel en tant que freelance.",
  sub_category: freelance,
  paragraph1: "Découvrez des stratégies et des techniques pour développer votre réseau professionnel en tant que freelance, y compris la participation à des événements de réseautage, l'utilisation des médias sociaux et la création de relations solides avec d'autres professionnels de votre domaine.",
)
article6.photo.attach(io: File.open("app/assets/images/reseau.jpg"), filename: "reseau.jpg")
article6.save!
# Seed Platforms
platform1 = Platform.create(name: "GitHub", url: "https://github.com", logo: "github_logo.png", description: "Where the world builds software.")
platform2 = Platform.create(name: "Medium", url: "https://medium.com", logo: "medium_logo.png", description: "Read, write and share stories that matter.")

# Seed ArticlesPlatforms Join Table
ArticlesPlatform.create(article: article1, platform: platform1)
ArticlesPlatform.create(article: article2, platform: platform2)

# Seed MyGuides
my_guide_1 = MyGuide.create!(
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

my_guide_2 = MyGuide.create!(
  article: article2,
  user: user_2,
  occupation: "Graphic Designer",
  address: "456 Elm St, Townville",
  social_security: "987-65-4321",
  business_structure: "Personne morale",
  is_micro_entrepreneur: false,
  is_business_extension: true,
  has_previous_self_employment: true,
  representative_role: "Personne ayant le pouvoir d'engager l'établissement",
  representative_type: "Personne morale"
)

my_guide_3 = MyGuide.create!(
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

asso_1 = Asso.create(name: "AFE", photo: "", address: "14 rue Delambre, 75014 paris, France")
asso_2 = Asso.create(name: "BGE Parif", photo: "", address: "168 Bis rue Raymond Losserand, 75015 paris, France")
asso_3 = Asso.create(name: "CCI Paris", photo: "", address: "16 rue Yves Toudic, 75010 paris, France")
asso_4 = Asso.create(name: "BPI France", photo: "", address: "8, boulevard Haussmann, 75009 paris, France")
asso_5 = Asso.create(name: "Station F", photo: "", address: "55 Boulevard Vincent Auriol, 75013 paris, France")

puts "Seed data loaded successfully!"

Reminder.create!(
  title: "Appointment with accountant",
  description: "Discuss the annual financial statements and tax filings.",
  url: "http://example.com/meeting/accountant",
  status: 'Terminé',
  start_time: DateTime.now + 5.days, # Scheduled for 5 days from now
  end_time: DateTime.now + 5.days + 2.hours, # 2 hours long meeting
  user: user_1,
  my_guide: my_guide_1
)

puts "Reminders seeded!"
