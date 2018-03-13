FactoryBot.define do
  factory :employee, class: Employee do
    first_name "First name demo"
    last_name "Last name demo"
    summary "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
    college "San Ignacio de Loyola University"
    degree "Software Engineer"
    position "developer"
    association :team, factory: :team
    photo { File.new("#{Rails.root}/spec/support/example.jpg") }
  end

end
