class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :liked_id
      t.timestamps
    end

    add_index :likes, [:user_id, :liked_id]
  end
end
