class CreateEmployeeLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_languages do |t|
      t.string :language
      t.string :level
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
