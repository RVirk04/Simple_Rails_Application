class Product < ApplicationRecord
  # This AR object is linked with the products table.

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  # All columns within products table are - product_id, name, description, price, stock_quantity, category_id, created_at, updated_at.
  # This products table contain a column named category_id which represents a reference to category table.
  belongs_to :category

  # Ensure that the product always includes a title, price and stock_quantity
  validates :title, :price, :stock_quantity, presence: true
end
