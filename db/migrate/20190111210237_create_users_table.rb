class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "e_mail"
      t.string "password_digest"
      t.string "address_line_1"
      t.string "address_line_2"
      t.string "unit"
      t.string "city"
      t.string "state"
      t.integer "zip_code"
    end
  end
end
