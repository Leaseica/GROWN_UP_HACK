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
User.destroy_all
Category.destroy_all
SubCategory.destroy_all
Article.destroy_all
Platform.destroy_all
MyGuide.destroy_all

# Seed Users
user_1 = User.create(email: "user1@example.com", password: "123456", first_name: "John", last_name: "Doe", occupation: "Developer", address: "1 rue premier", birthday: "1990-01-01")
user_2 = User.create(email: "user2@example.com", password: "123456", first_name: "Jane", last_name: "Doe", occupation: "Coach", address: "2 rue deuxieme", birthday: "1997-03-03")
user_3 = User.create(email: "user3@example.com", password: "123456", first_name: "Jeff", last_name: "Doe", occupation: "Developer", address: "3 rue troisieme", birthday: "1998-02-02")

# Seed Categories
technology = Category.create(name: "Technology", description: "All about technology")
lifestyle = Category.create(name: "Lifestyle", description: "Tips and tricks for a better life")

# Seed SubCategories
web_dev = SubCategory.create(name: "Web Development", description: "Developing websites", category: technology)
health_fitness = SubCategory.create(name: "Health & Fitness", description: "Health and fitness advice", category: lifestyle)

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
MyGuide.create(article: article1, occupation: "Developer", address: "1234 Street", social_security: "123-45-6789", user: user_1)
MyGuide.create(article: article2, occupation: "Coach", address: "5678 Avenue", social_security: "987-65-4321", user: user_2)

puts "Seed data loaded successfully!"
