class DoubleCheck < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :description, :text 
    change_column :products, :price, 'decimal USING CAST(price AS decimal)', precision: 10, scale: 2
  end
end
