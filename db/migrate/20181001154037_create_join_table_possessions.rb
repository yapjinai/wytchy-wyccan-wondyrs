class CreateJoinTablePossessions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :items do |t|
    end
  end
end
