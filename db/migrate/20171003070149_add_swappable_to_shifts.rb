class AddSwappableToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :swappable, :boolean
  end
end
