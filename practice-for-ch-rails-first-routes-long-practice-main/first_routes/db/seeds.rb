# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do 
    puts "Preparing environment"

    puts 'Destroying tables'
    User.destroy_all
    Artwork.destroy_all
    # Artwork_share.destroy_all

    puts "Resetting id sequences"

    # %w(users artworks artwork_shares).each do |table_name|
    #     ApplicationRecord.connection.reset_pk_squence!(table_name)
    # end

    puts "creating seed data"

    anton = User.create(
        username: "Anton"
    )
    kevin = User.create(
        username: "Kevin"
    )
    spencer = User.create(
        username: "Spencer"
    )
    kin = User.create(
        username: "Kin"
    )

    mona_lisa = Artwork.create(
        title: "mona lisa",
        image_url: "www.monalisa.com",
        artist_id: kin.id
    )

    the_last_supper = Artwork.create(
        title: "the last supper",
        image_url: "www.thelastsupper.com",
        artist_id: spencer.id
    )
    the_starry_night = Artwork.create(
        title: "the starry night",
        image_url: "www.thestarrynight.com",
        artist_id: anton.id
    )

end