class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title, message:"Must be unique per title"}
    validates :title, uniqueness: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User
end