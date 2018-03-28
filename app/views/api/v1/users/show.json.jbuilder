json.type @user.class.name.underscore.pluralize
json.id @user.id
json.set! :attributes do
    json.merge! @user.attributes.except("password_digest")
    json.jwt @jwt
end
