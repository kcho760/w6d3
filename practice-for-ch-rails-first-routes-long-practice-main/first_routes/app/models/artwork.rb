class Artwork
    validates :artist_id, uniqueness: {scope: :title, message:"Must be unique per title"}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User
end