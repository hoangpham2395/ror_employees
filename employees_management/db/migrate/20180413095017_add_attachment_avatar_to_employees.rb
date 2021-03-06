class AddAttachmentAvatarToEmployees < ActiveRecord::Migration[5.1]
  def self.up
    change_table :employees do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :employees, :avatar
  end
end
