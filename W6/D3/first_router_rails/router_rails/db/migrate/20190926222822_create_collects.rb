class CreateCollects < ActiveRecord::Migration[5.2]
  def change
    create_table :collects do |t|
      t.integer :user_id
      t.integer :artwork_id
      t.timestamps
    end
    
    add_index :collects, [:artwork_id, :user_id], unique: true
  end
end
