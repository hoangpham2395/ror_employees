class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :username
      t.string :fullname
      t.string :email_company
      t.string :email_personal
      t.string :tel
      t.integer :gender
      t.date :birthday
      t.string :department
      t.string :position
      t.string :skill
      t.string :literacy
      t.string :contract_type
      t.string :status
      t.string :address
      t.string :bank_account
      t.string :id_number
      t.string :descriptrion
      t.date :join_datetime
      t.date :exit_datetime
      t.float :leavedays_have
      t.float :leavedays_took
      t.string :leavedays_note
      t.string :user_type

      t.timestamps
    end
  end
end
