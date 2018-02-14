json.partial! "api/v1/resource", resource: @employee, relations: ["area_interests","certifications","degrees","jobs","languages","strengths"]
json.set! :attributes do
  json.photo_url @employee.photo.file? ? asset_url(@employee.photo.url) : nil
end
