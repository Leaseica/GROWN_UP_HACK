class MigrateParagraph1toRichBodyArticles < ActiveRecord::Migration[7.1]
  def up
    Article.find_each do |article|
      article.update(rich_body: article.paragraph1)
    end
  end

  def down
    Article.find_each do |article|
      article.update(paragraph1: article.rich_body)
      article.update(rich_body: nil)
    end
  end
end
