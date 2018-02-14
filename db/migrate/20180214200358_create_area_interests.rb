class CreateAreaInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :area_interests do |t|
      t.references :employee, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
