class RemoveDescriptrion < ActiveRecord::Migration[5.1]
  def change
  	remove_column :employees, :descriptrion, :string
  end
end
