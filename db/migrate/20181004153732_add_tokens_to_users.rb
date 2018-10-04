class AddTokensToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tokens, :integer, default: 0
  end
end
