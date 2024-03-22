class Category < ApplicationRecord
  include PgSearch::Model

  has_many :sub_categories, dependent: :destroy
  has_many :articles, through: :sub_categories
  has_one_attached :photo

  pg_search_scope :global_search,
  against: [ :name ],
  associated_against: {
    sub_categories: [ :name ],
    articles: [ :title ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
