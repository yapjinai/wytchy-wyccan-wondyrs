class AddQuantityToItemsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :items_users, :quantity, :integer
  end
end
