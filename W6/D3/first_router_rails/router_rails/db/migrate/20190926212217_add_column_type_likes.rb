class AddColumnTypeLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :liked_type, :string
  end
end
