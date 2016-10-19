class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :product_amount

      t.timestamps null: false
    end
  end
end
