class CreateSchedulesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules_users do |t|

      t.timestamps
    end
  end
end
