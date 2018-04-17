class CreateOts < ActiveRecord::Migration[5.1]
  def change
    create_table :ots do |t|
      t.references :employee, foreign_key: true
      t.references :project, foreign_key: true
      t.date :ot_datetime
      t.float :ot_hour
      t.string :ot_reason
      t.integer :del_flag

      t.timestamps
    end
  end
end
