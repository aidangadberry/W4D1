# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

User.create(username: "firstuser")
User.create(username: "seconduser")
User.create(username: "thirduser")
User.create(username: "fourthuser")

Artwork.create(title: "firstart", image_url: "first@art.com", artist_id: User.first.id)
Artwork.create(title: "secondart", image_url: "second@art.com", artist_id: User.second.id)

ArtworkShare.create(artwork_id: Artwork.first.id, viewer_id: User.third.id)
ArtworkShare.create(artwork_id: Artwork.first.id, viewer_id: User.fourth.id)
ArtworkShare.create(artwork_id: Artwork.second.id, viewer_id: User.first.id)
ArtworkShare.create(artwork_id: Artwork.second.id, viewer_id: User.fourth.id)