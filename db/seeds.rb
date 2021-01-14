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
user3 = User.create(first_name: "Leonardo", last_name: "DiCaprio", username: "Leo", email: "leo@dicaprio.com", password_digest: "123")
user4 = User.create(first_name: "Harrison", last_name: "Ford", username: "Indy", email: "harrison@ford.com", password_digest: "123")

wonder_woman = Movie.create(title: "Wonder Woman 1984", poster: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", movie_id: 464052)
soul = Movie.create(title: "Soul", poster: "/hm58Jw4Lw8OIeECIq5qyPYhAeRJ.jpg", movie_id: 508442)

review1 = Review.create(body: "I saw this movie last Saturday. I was not impressed.", rating: 2, user_id: user1.id, movie_id: wonder_woman.id)
review2 = Review.create(body: "It was another charming movie from Pixar", rating: 4, user_id: user3.id, movie_id: soul.id)
review3 = Review.create(body: "The first one was good, but this one was terrible", rating: 1, user_id: user4.id, movie_id: wonder_woman.id)


Friendship.create(follower_id: user2.id, followee_id: user1.id)
Friendship.create(follower_id: user2.id, followee_id: user3.id)
Friendship.create(follower_id: user3.id, followee_id: user4.id)
Friendship.create(follower_id: user3.id, followee_id: user1.id)

watchlist1 = Watchlist.create(user_id: user2.id, movie_id: soul.id)
watchlist2 = Watchlist.create(user_id: user1.id, movie_id: wonder_woman.id)
walchlist3 = Watchlist.create(user_id: user2.id, movie_id: wonder_woman.id)
