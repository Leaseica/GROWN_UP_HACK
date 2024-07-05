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

  multisearchable against: [:name],
  using: {
    tsearch: { prefix: true }
  }

  PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true } } }

  def self.ransackable_associations(auth_object = nil)
    ["articles", "sub_categories", "photo_attachment", "photo_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "updated_at"]
  end


end
