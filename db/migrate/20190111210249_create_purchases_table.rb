class CreatePurchasesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :content_id
      t.float :purchase_price
      t.index ["user_id"], name: "index_purchases_on_content_id"
      t.index ["content_id"], name: "index_purchases_on_users_id"
    end
  end
end
