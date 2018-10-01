class CreateJoinTableSpellsItems < ActiveRecord::Migration[5.2]
  def change
    create_join_table :spells, :items do |t|
      t.integer :quantity
    end
  end
end
