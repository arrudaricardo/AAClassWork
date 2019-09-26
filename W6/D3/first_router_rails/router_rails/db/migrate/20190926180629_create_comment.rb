class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id
      t.integer :artwork_id
    end

    add_index :comments, :user_id
  end
end
