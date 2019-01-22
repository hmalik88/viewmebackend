class AddColumnToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :url, :string
  end
end
