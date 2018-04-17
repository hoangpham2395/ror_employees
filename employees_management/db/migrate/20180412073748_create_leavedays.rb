class CreateLeavedays < ActiveRecord::Migration[5.1]
  def change
    create_table :leavedays do |t|
      t.references :employee, foreign_key: true
      t.date :leave_datetime
      t.float :leave_hour
      t.string :leave_reason
      t.integer :del_flag

      t.timestamps
    end
  end
end
