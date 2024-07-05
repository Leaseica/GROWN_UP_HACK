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

  multisearchable against: [:name],
  using: {
    tsearch: { prefix: true }
  }

  PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true } } }

  def self.ransackable_associations(auth_object = nil)
    ["articles", "photo_attachment", "photo_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "id_value", "name", "updated_at"]
  end

end
