# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(username: 'jorj', password: 'password', role: 1)
user2 = User.create(username: 'Angela', password: '12345')
user3 = User.create(username: 'Carlos', password: '12345')

author1 = Author.create(name: 'Card, Orson Scott')
author2 = Author.create(name: 'Tepper, Sherri S.')
author3 = Author.create(name: 'King, Stephen')

author1.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
author1.books.create(title: "Treason", year: 1988, image: "Treason.jpg")
author2.books.create(title: "Gate to Women's Country, The", year: 1988, image: "The_Gate_to_Women's_Country.jpg")
author2.books.create(title: "Awakeners, The", year: 1987, image: "The_Awakeners.jpg")
author3.books.create(title: "Shining, The", year: 1977, image: "The_Shining.jpg")
author3.books.create(title: "Stand, The", year: 1978, image: "The_Stand.jpg")
author3.books.create(title: "Carrie", year: 1974, image: "Carrie.jpg")

user2.reviews.create(rating: 5, comment: 'Excellent!', book_id: 1)
user3.reviews.create(rating: 4, comment: 'Pretty Good!', book_id: 1)
user2.reviews.create(rating: 4, comment: 'Really interesting', book_id: 2)
user3.reviews.create(rating: 4, comment: 'I liked it', book_id: 2)
