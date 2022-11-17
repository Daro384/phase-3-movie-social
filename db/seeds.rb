puts "🌱 Seeding spices..."

puts "Deleting Data..."
User.destroy_all
Movie.destroy_all
Review.destroy_all

puts "Creating Users..."

mike = User.create(username: "Mike")
adam = User.create(username: "Adam")
andrew = User.create(username: "Andrew")
peter = User.create(username: "Peter")
matthew = User.create(username: "Matthew")

puts "Creating Movies..."

titanic = Movie.create(title: "Titanic", year: 1997, img_url: "...")
star_wars = Movie.create(title: "Star Wars", year: 1977, img_url: "...")
iron_man = Movie.create(title: "Iron Man", year: 2008, img_url: "...")
harry_potter = Movie.create(title: "Harry Potter", year: 2001, img_url: "...")
godfather = Movie.create(title: "The Godfather", year: 1972, img_url: "...")

puts "Creating Reviews..."

Review.create(review: "Bad", rating: 1, user: mike, movie: titanic)
Review.create(review: "good", rating: 4, user: adam, movie: titanic)
Review.create(review: "decent", rating: 3, user: andrew, movie: star_wars)
Review.create(review: "Best!", rating: 5, user: peter, movie: star_wars)
Review.create(review: "Great", rating: 4, user: matthew, movie: star_wars)
Review.create(review: "like it", rating: 4, user: mike, movie: iron_man)
Review.create(review: "love it", rating: 5, user: adam, movie: harry_potter)
Review.create(review: "Boring", rating: 1, user: peter, movie: godfather)
Review.create(review: "too short", rating: 5, user: andrew, movie: godfather)

puts "✅ Done seeding!"
