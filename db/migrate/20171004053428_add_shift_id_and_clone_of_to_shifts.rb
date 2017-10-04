class AddShiftIdAndCloneOfToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :shift_id, :integer
    add_column :shifts, :clone_of, :integer
  end
end
