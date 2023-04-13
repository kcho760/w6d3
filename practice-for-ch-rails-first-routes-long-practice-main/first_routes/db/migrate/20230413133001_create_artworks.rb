class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, uniqueness: true
      t.string :image_url, null: false, index: true, uniqueness: true
      t.bigint :artist_id, null: false, index: true
      t.timestamps
    end
    add_foreign_key :artworks, :users, column: :artist_id
  end
end
