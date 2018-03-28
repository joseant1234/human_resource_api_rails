class CreateLinkSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :link_skills do |t|
      t.references :skill, foreign_key: true
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
