class Platform < ApplicationRecord
  has_many :articles_platforms
  has_many :articles, through: :articles_platforms
end
