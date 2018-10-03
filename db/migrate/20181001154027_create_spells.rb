class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.string :subject_1
      t.string :subject_2

      t.timestamps
    end
  end
end
