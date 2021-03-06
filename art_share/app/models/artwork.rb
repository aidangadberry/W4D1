# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: {scope: :title}
  validates :title, :image_url, :artist_id, presence: true
  
  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
  
  has_many :artwork_shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
  
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
