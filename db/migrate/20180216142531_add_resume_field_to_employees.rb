class AddResumeFieldToEmployees < ActiveRecord::Migration[5.1]
  def up
    add_attachment :employees, :resume
  end

  def down
  	remove_attachment :employees, :resume
  end
end
