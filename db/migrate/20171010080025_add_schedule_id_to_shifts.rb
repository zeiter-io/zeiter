class AddScheduleIdToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :schedule_id, :integer
  end
end
