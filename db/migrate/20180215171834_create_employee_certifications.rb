class CreateEmployeeCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_certifications do |t|
      t.references :employee, foreign_key: true
      t.string :certification
      t.date :date

      t.timestamps
    end
  end
end
