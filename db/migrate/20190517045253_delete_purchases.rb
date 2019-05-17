class DeletePurchases < ActiveRecord::Migration[5.2]
  def change
    drop_table :purchases
  end
end
