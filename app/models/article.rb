class Article < ApplicationRecord
  belongs_to :sub_category
  has_many :my_guides
  has_many :platforms, through: :articles_plateforms, source: :join_association_table_foreign_key_to_platforms_table

  validates :title, presence: true, uniqueness: true
  has_one_attached :photo
end
