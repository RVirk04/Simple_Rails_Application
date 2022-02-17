class Product < ApplicationRecord

  # Ensure that the product always includes a title, price and stock_quantity
  validates :title, :price, :stock_quantity, presence: true
end
