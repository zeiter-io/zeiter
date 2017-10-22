class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.timestamps
    end
    
    add_index :enrollments, [:user_id, :schedule_id], unique: true
  end
end
