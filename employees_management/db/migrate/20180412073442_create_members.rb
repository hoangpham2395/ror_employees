class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.references :employee, foreign_key: true
      t.references :project, foreign_key: true
      t.string :join_status
      t.integer :user_type
      t.integer :del_flag

      t.timestamps
    end
  end
end
