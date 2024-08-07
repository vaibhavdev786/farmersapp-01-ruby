class CartProduct < ApplicationRecord
  self.table_name = :cart_products

  belongs_to :cart
  belongs_to :product_variant
  has_one :product, through: :product_variant
end
