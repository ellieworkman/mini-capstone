class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :product_id
      t.string :integer
      t.string :image_id
      t.string :integer

      t.timestamps
    end
  end
end
