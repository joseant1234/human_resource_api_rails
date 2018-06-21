# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180216142531) do

  create_table "employee_certifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.string "certification"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_certifications_on_employee_id"
  end

  create_table "employee_interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.string "interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_interests_on_employee_id"
  end

  create_table "employee_languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "language"
    t.string "level"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_languages_on_employee_id"
  end

  create_table "employee_project_responsabilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_project_id"
    t.string "responsability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_project_id"], name: "index_employee_project_responsabilities_on_employee_project_id"
  end

  create_table "employee_project_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_project_id"
    t.string "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_project_id"], name: "index_employee_project_skills_on_employee_project_id"
  end

  create_table "employee_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.date "start_date"
    t.date "end_date"
    t.string "title"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_projects_on_employee_id"
  end

  create_table "employee_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.string "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_skills_on_employee_id"
  end

  create_table "employee_soft_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.string "soft_skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_soft_skills_on_employee_id"
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.text "summary"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "college"
    t.string "degree"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resume_file_name"
    t.string "resume_content_type"
    t.integer "resume_file_size"
    t.datetime "resume_updated_at"
    t.index ["team_id"], name: "index_employees_on_team_id"
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employee_certifications", "employees"
  add_foreign_key "employee_interests", "employees"
  add_foreign_key "employee_languages", "employees"
  add_foreign_key "employee_project_responsabilities", "employee_projects"
  add_foreign_key "employee_project_skills", "employee_projects"
  add_foreign_key "employee_projects", "employees"
  add_foreign_key "employee_skills", "employees"
  add_foreign_key "employee_soft_skills", "employees"
  add_foreign_key "employees", "teams"
end
