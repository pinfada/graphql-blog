# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  user = User.create!(
  	name: Faker::Name.first_name, 
  	nickname: Faker::Name.last_name,
  	email: Faker::Internet.email,
  	password: Faker::Internet.password)
  3.times do
    user.posts.create!(title: Faker::Lorem.sentence(word_count = 3), body: Faker::Lorem::paragraph(sentence_count = 3))
  end
end