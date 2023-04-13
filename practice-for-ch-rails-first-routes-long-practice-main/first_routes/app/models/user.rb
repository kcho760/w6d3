# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :artwork_shares, # not sure about foreign key
        class_name: :ArtworkShare,
        foreign_key: :viewer_id,
        dependent: :destroy

    has_many :shares, # ArtworkShare -> Artwork
        through: :artwork_shares,
        source: :artwork,
        dependent: :destroy
end
