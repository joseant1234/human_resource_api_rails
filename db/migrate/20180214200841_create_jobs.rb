class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :workplace
      t.string :position
      t.date :enter_on
      t.date :finish_on
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
