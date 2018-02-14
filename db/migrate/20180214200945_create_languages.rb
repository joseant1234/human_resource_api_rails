class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :institute
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
