class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.boolean :binate

      t.timestamps
    end
  end
end
