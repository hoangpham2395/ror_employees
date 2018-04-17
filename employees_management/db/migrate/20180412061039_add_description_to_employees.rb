class AddDescriptionToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :description, :string
  end
end
