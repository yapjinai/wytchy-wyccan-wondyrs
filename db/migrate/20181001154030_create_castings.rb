class CreateCastings < ActiveRecord::Migration[5.2]
  def change
    create_table :castings do |t|
      t.integer :user_id
      t.integer :spell_id
      t.string :subject_1
      t.string :subject_2
      
      t.timestamps
    end
  end
end
