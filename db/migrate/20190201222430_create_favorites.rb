class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :content_id
      t.string :name
      t.string :url
    end
  end
end
