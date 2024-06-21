class Article < ApplicationRecord
  belongs_to :sub_category
  has_many :my_guides
  has_many :articles_platforms
  has_many :platforms, through: :articles_platforms

  validates :title, presence: true, uniqueness: true
  has_one_attached :photo

end
