class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.column :publish, :boolean, :deafult => false
      t.column :name, :string
      t.column :chapter, :string
      t.column :customer, :string
      t.column :brief, :text
      t.column :artdirector, :string
      t.column :leaddesigner, :string
      t.column :designer, :string
      t.column :leadprogrammer, :string
      t.column :programmer, :string
      t.column :copywrighter, :string
      t.column :manager, :string
      t.column :task, :text
      t.column :solution, :text
      t.column :url, :string
      t.column :thumb_file_name,    :string
      t.column :thumb_content_type, :string
      t.column :thumb_file_size,    :integer
      t.column :thumb_updated_at,   :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
