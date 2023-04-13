# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id

end
