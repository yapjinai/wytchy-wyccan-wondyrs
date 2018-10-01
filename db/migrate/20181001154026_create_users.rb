class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :gender
      t.datetime :birthday
      t.string :bloodtype

      t.timestamps
    end
  end
end
