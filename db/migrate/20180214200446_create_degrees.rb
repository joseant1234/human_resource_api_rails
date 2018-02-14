class CreateDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :degrees do |t|
      t.references :employee, foreign_key: true
      t.string :title
      t.string :university

      t.timestamps
    end
  end
end
