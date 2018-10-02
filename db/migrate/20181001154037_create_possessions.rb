class CreatePossessions < ActiveRecord::Migration[5.2]
  def change
    create_table :possessions do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :quantity
      t.timestamps
    end
  end
end
