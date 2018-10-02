class ChangeSpellsDescription < ActiveRecord::Migration[5.2]
  def change
    change_table :spells do |t|
      change_column(:spells, :description, :text)
    end
  end
end
