class Article < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :description],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :sub_category
  has_one_attached :photo
  has_many :my_guides
  has_many :articles_platforms
  has_many :platforms, through: :articles_platforms

  validates :title, presence: true, uniqueness: true



  serialize :additional_resources_1_listing, JSON
  serialize :additional_resources_2_listing, JSON

  def additional_resources_1_listing
    if self[:additional_resources_1_listing].present?
      Platform.where(id: self[:additional_resources_1_listing])
    else
      []
    end
  end

  def additional_resources_2_listing
    if self[:additional_resources_2_listing].present?
      Platform.where(id: self[:additional_resources_2_listing])
    else
      []
    end
  end

  def platforms
    if self[:platform_ids].present?
      Platform.where(id: self[:platform_ids])
    else
      []
    end
  end


  # Define ransackable associations
  def self.ransackable_associations(auth_object = nil)
    ["my_guides", "sub_category", "platforms", "articles_platforms", "photo_attachment", "photo_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "paragraph1", "raw_html_content", "sub_category_id", "title", "updated_at", "additional_resources_1", "additional_resources_2", "additional_resources_1_listing", "additional_resources_2_listing", "platform_ids"]
  end


end
