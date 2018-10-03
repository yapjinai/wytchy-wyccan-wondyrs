class AddSymbolToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :symbol, :string
  end
end
