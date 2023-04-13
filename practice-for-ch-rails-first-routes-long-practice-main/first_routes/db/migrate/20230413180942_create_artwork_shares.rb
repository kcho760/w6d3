class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.bigint :artwork_id, null: false, index: true
      t.bigint :viewer_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
    add_foreign_key :artwork_shares, :users, column: :viewer_id
  end
end
