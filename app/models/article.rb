class Article < ApplicationRecord
  belongs_to :sub_category
  has_one_attached :photo
  has_many :my_guides
  has_many :articles_platforms
  has_many :platforms, through: :articles_platforms

  validates :title, presence: true, uniqueness: true


  # Define ransackable associations
  def self.ransackable_associations(auth_object = nil)
    ["my_guides", "sub_category", "platforms", "articles_platforms", "photo_attachment", "photo_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "paragraph1", "raw_html_content", "sub_category_id", "title", "updated_at"]
  end


end
