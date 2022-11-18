puts "🌱 this only deletes all data"

puts "Deleting Data..."
User.destroy_all
Movie.destroy_all
Review.destroy_all

puts "✅ Done seeding!"
