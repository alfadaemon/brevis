class CreateBrevis < ActiveRecord::Migration[5.2]
  def change
    create_table :brevis do |t|
      t.string :protocol, default: 'http'
      t.string :original_url, null: false
      t.string :slug, null: false
      t.integer :clicks, default: 0

      t.timestamps
    end
    add_index :brevis, :slug, unique: true
    add_index :brevis, :original_url, unique: true
  end
end
