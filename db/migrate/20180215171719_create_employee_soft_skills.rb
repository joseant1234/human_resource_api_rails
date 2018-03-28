class CreateEmployeeSoftSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_soft_skills do |t|
      t.references :employee, foreign_key: true
      t.string :soft_skill

      t.timestamps
    end
  end
end
