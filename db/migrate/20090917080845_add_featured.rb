class AddFeatured < ActiveRecord::Migration
  def self.up
    add_column :works, :featured, :boolean, :default => false
  end

  def self.down
    remove_column :works, :featured
  end
end
