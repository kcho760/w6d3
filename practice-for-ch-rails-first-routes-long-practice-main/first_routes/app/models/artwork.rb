# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title, message:"Must be unique per title"}
    validates :title, uniqueness: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares, # same issue as user foreign key
        class_name: :ArtworkShare,
        foreign_key: :artwork_id

end
