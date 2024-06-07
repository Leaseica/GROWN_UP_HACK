class Article < ApplicationRecord
  belongs_to :sub_category
  has_many :my_guides
  has_many :platforms, through: :articles_plateforms, source: :join_association_table_foreign_key_to_platforms_table

  validates :title, presence: true, uniqueness: true
  has_one_attached :photo

  # def rendered_html_content(view_context)
  #   ERB.new(raw_html_content).result(view_context.get_binding)
  # rescue SyntaxError => e
  #   Rails.logger.error("ERB Syntax Error: #{e.message}")
  #   "Error rendering content"
  # end
end
