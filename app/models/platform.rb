class Platform < ApplicationRecord
  has_many :articles_platforms
  has_many :articles, through: :articles_platforms
  has_one_attached :photo
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  TYPES = ["Resources", "Freelance", "Education", "Networking", "Tools"]

  # validates :type, inclusion: { in: TYPES }

  def self.ransackable_associations(auth_object = nil)
    ["articles", "articles_platforms", "photo_attachment", "photo_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at", "url", "description", "logo", "platform_type"]
  end
end
