class SoManyChanges < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :product_id, "numeric USING product_id::integer"
    change_column :images, :product_id, :integer
    rename_column :images, :image_id, :image_link
    remove_column :images, :integer, :integer
    remove_column :products, :image, :string  
  end
end
