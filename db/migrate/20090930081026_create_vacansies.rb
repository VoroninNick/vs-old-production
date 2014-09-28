class CreateVacansies < ActiveRecord::Migration
  def self.up
    create_table :vacansies do |t|
      t.column :publish, :boolean, :deafult => false
      t.column :name, :string
      t.column :brief, :text
      t.column :text, :text
      t.column :thumb_file_name,    :string
      t.column :thumb_content_type, :string
      t.column :thumb_file_size,    :integer
      t.column :thumb_updated_at,   :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :vacansies
  end
end
