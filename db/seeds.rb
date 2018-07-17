# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
author1 = Author.create(name: 'Orson Scott Card')
author2 = Author.create(name: 'Sherri S. Tepper')
author3 = Author.create(name: 'Stephen King')

author1.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
author1.books.create(title: "Treason", year: 1988, image: "Treason.jpg")
author2.books.create(title: "The Gate to Women's Country", year: 1988, image: "The_Gate_to_Women's_Country.jpg")
author2.books.create(title: "The Awakeners", year: 1987, image: "The_Awakeners.jpg")
author3.books.create(title: "The Shining", year: 1977, image: "The_Shining.jpg")
author3.books.create(title: "The Stand", year: 1978, image: "The_Stand.jpg")
author3.books.create(title: "Carrie", year: 1974, image: "Carrie.jpg")
