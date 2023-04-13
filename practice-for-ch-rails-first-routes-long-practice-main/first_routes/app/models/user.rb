class User < ApplicationRecord
    validates :username, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork
end