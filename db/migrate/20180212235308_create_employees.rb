class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.text :summary
      t.attachment :photo
      t.string :college
      t.string :degree
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
