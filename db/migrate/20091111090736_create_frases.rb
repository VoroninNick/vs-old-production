class CreateFrases < ActiveRecord::Migration
  def self.up
    create_table :frases do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :author, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :frases
  end
end
