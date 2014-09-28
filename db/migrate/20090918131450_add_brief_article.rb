class AddBriefArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :brief, :text
  end

  def self.down
    remove_column :articles, :brief
  end
end
