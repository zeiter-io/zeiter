class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :duration
      t.boolean :repeat
      t.integer :repeat_every
      t.string :repeat_every_unit
      t.datetime :repeat_end_date

      t.timestamps
    end
  end
end
