class CreateOts < ActiveRecord::Migration[5.1]
  def change
    create_table :ots do |t|
      t.integer :project_id
      t.integer :user_id
      t.date :ot_datetime
      t.float :ot_hour

      t.timestamps
    end
  end
end
