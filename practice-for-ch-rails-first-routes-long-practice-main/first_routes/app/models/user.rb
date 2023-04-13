class User < ApplicationRecord
    validates :username, uniqueness: true

    has_many :artworks,
        foreign_key: :user_id,
        class_name: :Artwork
end