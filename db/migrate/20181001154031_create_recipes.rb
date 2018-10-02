class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :spell_id
      t.integer :item_id
      t.integer :quantity
      t.timestamps
    end
  end
end
