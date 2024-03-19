class Platform < ApplicationRecord
  has_many :articles, through: :articles_plateforms, source: :join_association_table_foreign_key_to_articles_table
end
