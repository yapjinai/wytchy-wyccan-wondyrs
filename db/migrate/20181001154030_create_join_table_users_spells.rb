class CreateJoinTableUsersSpells < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :spells do |t|
    end
  end
end
