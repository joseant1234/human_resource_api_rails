json.set! :data do
	json.partial! partial: "api/v1/resource", collection: @employees, as: :resource
end
json.set! :pagination do
	json.total_pages @employees.total_pages
end


