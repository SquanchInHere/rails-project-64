# frozen_string_literal: true

require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do
  Category.create(name: Faker::DcComics.title)
end
categories = Category.all

3.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'secret',
    password_confirmation: 'secret'
  )

  2.times do
    post = user.posts.create(
      title: Faker::DcComics.villain,
      body: Faker::Lorem.paragraph_by_chars(number: 255),
      category_id: categories.sample.id
    )

    post.likes.create(user:)

    comment = post.comments.create(content: 'тестовый комментарий', user:)
    post.comments.create(content: 'тестовый комментарий вложенный', user:, parent: comment)
  end
end
