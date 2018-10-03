class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.boolean :subject_1_required
      t.boolean :subject_2_required

      t.timestamps
    end
  end
end
