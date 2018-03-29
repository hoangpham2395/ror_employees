class CreateLeavedays < ActiveRecord::Migration[5.1]
  def change
    create_table :leavedays do |t|
      t.integer :user_id
      t.date :leave_datetime
      t.float :leave_hour
      t.string :leave_reason
      t.string :del_flag

      t.timestamps
    end
  end
end
