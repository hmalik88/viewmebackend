class CreateContentTable < ActiveRecord::Migration[5.2]
  def change
    create_table :content do |t|
      t.string :user_id
      t.string :name
      t.string :channel
    end
  end
end
