class Platform < ApplicationRecord
  has_many :articles_platforms
  has_many :articles, through: :articles_platforms

  def self.ransackable_associations(auth_object = nil)
    ["articles", "articles_platforms"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at", "url", "description", "logo"]
  end
end
