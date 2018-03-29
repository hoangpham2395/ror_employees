class CreateUserProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_projects do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :user_type
      t.string :join_status
      t.integer :del_flag

      t.timestamps
    end
  end
end
