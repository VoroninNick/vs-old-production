class PosCreateWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :created, :date
    add_column :works, :position, :integer
  end

  def self.down
    remove_column :works, :created
    remove_column :works, :position
  end
end
