require 'rails_helper'
require "shoulda/matchers"
RSpec.describe Employee, :type => :model do
	it { should validate_presence_of(:first_name) }
	it { should belong_to(:team) }
	it { should have_many(:employee_languages) }
	it { should have_many(:employee_projects) }
	it { should have_many(:employee_skills) }
	it { should have_many(:employee_soft_skills) }
	it { should have_many(:employee_interests) }

	it "should expect that length of the list employee not be empty when have employee with position Developer" do
		employee = FactoryBot.create(:employee)
		employees = Employee.filter_by_position("developer")
		expect(employees.length).not_to be([])
	end

	it "should expect that length of the list employee not be empty when have employee with team Python" do
		employee = FactoryBot.create(:employee)
		employees = Employee.filter_by_team(4)
		expect(employees.length).not_to be([])
	end


end
