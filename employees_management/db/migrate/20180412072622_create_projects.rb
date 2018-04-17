class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_status
      t.date :start_datetime
      t.date :end_datetime
      t.string :project_lang
      t.string :description
      t.integer :del_flag

      t.timestamps
    end
  end
end
