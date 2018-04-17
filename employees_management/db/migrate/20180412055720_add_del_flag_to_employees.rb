class AddDelFlagToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :del_flag, :integer
  end
end
