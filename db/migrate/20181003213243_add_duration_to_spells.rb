class AddDurationToSpells < ActiveRecord::Migration[5.2]
  def change
    add_column :spells, :duration, :integer
  end
end
