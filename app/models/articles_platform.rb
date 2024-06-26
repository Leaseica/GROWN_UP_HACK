class ArticlesPlatform < ApplicationRecord
  belongs_to :article
  belongs_to :platform

  def self.ransackable_attributes(auth_object = nil)
    ["article_id", "created_at", "id", "id_value", "platform_id", "updated_at"]
  end
end
