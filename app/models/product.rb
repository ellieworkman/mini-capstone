class Product < ApplicationRecord
  belongs_to :supplier 
  has_many :images  

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :carted_products
  has_many :orders, through: :carted_products

  def sale_method
    if price < 2
      return "Discount Item!"
    else price > 2
      return "On Sale!"
    end
  end 

  def tax
    return price.to_f * 0.09 
  end

  def subtotal
    return price.to_f
  end

  def total 
    return tax + price.to_f
  end 
end


