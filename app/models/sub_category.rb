class SubCategory < ApplicationRecord
  include PgSearch::Model

  belongs_to :category
  has_many :articles
  has_one_attached :photo

  pg_search_scope :global_search,
  against: [ :name ],
  associated_against: {
    articles: [ :title ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
