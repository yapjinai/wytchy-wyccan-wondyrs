class AddFinishedAtToCastings < ActiveRecord::Migration[5.2]
  def change
    add_column :castings, :finished_at, :datetime
  end
end
