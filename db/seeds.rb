# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Friendship.destroy_all
Review.destroy_all
Watchlist.destroy_all
Movie.destroy_all

user1 = User.create(first_name: "Tom", last_name: "Hanks", username: "Mr. Banks", email: "tom@hanks.com", password_digest: "123")
user2 = User.create(first_name: "Robert", last_name: "De Niro", username: "Bob", email: "robert@dinero", password_digest: "123")
user3 = user1 = User.create(first_name: "Leonardo", last_name: "DiCaprio", username: "Leo", email: "leo@dicaprio.com", password_digest: "123")
user4 = User.create(first_name: "Harrison", last_name: "Ford", username: "Indy", email: "harrison@ford.com", password_digest: "123")

wonder_woman = Movie.create(movie_id: 464052)

review1 = Review.create(body: "I saw this movie last Saturday. I was not impressed.", rating: 2, user_id: user1.id, movie_id: wonder_woman.id)