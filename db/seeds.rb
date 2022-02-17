# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"
require 'faker'

Product.destroy_all
Category.destroy_all

# Generate 637 products
# 637.times do
#   Product.create([{
#     title: Faker::Commerce.product_name,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.number
#   }])
# end

# Add file path of the csv file
csv_file = Rails.root.join('db/products.csv')

csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|
  # puts product["name"]
  category = Category.find_or_create_by(name: product["category"])
  pro = category.products.create(
    title: product["name"],
    description: product["description"],
    price: product["price"],
    stock_quantity: product["stock quantity"]
  )
end
