class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.references :employee, foreign_key: true
      t.string :title
      t.integer :year

      t.timestamps
    end
  end
end
