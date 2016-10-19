class CreateTransactionProducts < ActiveRecord::Migration
  def change
    create_table :transaction_products do |t|
      t.string :product_name
      t.integer :product_unit_price
      t.string :product_description
      t.integer :product_quantity
      t.string :merchant_last_name
      t.string :merchant_first_name
      t.string :merchant_email

      t.timestamps null: false
    end
  end
end
