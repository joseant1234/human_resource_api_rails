if @errors.present?
  json.errors @errors
else
  json.data JSON.parse(yield)
end
