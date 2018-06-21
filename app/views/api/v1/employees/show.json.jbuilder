json.partial! "api/v1/resource", resource: @employee,
    relations: [
      "employee_interests","employee_certifications",
      "employee_languages","employee_soft_skills",
      "team"]
json.set! :attributes do
  json.photo @employee.photo.file? ? asset_url(@employee.photo.url) : nil
  json.resume @employee.resume.file? ? asset_url(@employee.resume.url) : nil
end
json.set! :relationships do
	json.employee_skills @employee.employee_skills.each do |employee_skill|
		json.type employee_skill.class.name.underscore.pluralize
		json.id employee_skill.id
		json.attributes employee_skill.attributes

		json.skill do
			json.type employee_skill.skill.class.name.underscore.pluralize
			json.id employee_skill.skill.id
			json.attributes employee_skill.skill.attributes
		end
	end
	json.employee_projects @employee.employee_projects.each do |employee_project|
		json.type employee_project.class.name.underscore.pluralize
		json.id employee_project.id
		json.attributes employee_project.attributes
		
		json.employee_project_responsabilities  employee_project.employee_project_responsabilities.each do |employee_project_responsability|
			json.type employee_project_responsability.class.name.underscore.pluralize
			json.id employee_project_responsability.id
			json.attributes employee_project_responsability.attributes
		end

		
		json.employee_project_skills  employee_project.employee_project_skills.each do |employee_project_skill|
			json.type employee_project_skill.class.name.underscore.pluralize
			json.id employee_project_skill.id
			json.attributes employee_project_skill.attributes

			json.skill do
				json.type employee_project_skill.skill.class.name.underscore.pluralize
				json.id employee_project_skill.skill.id
				json.attributes employee_project_skill.skill.attributes
			end
		end

	end
end

    