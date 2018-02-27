json.partial! "api/v1/resource", resource: @employee,
    relations: [
      "employee_interests","employee_certifications",
      "employee_languages","employee_soft_skills","employee_projects",
      "employee_skills","team","employee_project_skills","employee_project_responsabilities"]
json.set! :attributes do
  json.photo @employee.photo.file? ? asset_url(@employee.photo.url) : nil
  json.resume @employee.resume.file? ? asset_url(@employee.resume.url) : nil

end
