class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :studio_recording, default: true
    end
    add_index :albums, :title, unique: true
  end
end
