class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :articles
  has_one_attached :photo
end
