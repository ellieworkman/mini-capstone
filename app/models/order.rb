class Order < ApplicationRecord
  belongs_to :user 

  has_many :carted_products
  has_many :products, through: :carted_products
end

def subtotal
end 

def tax
  return price.to_f * 0.09 
end 

def total
  return tax + price.to_f
end 



