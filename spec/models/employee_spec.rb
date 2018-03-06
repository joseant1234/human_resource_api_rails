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
	
	it "should return length of the list employee with developer position" do
		employee = FactoryBot.create(:employee)
		employees = Employee.filter_by_position("developer")
		expect(employees.length).not_to be([])
	end

	it "should return length of the list employee with python team" do
		employee = FactoryBot.create(:employee)
		employees = Employee.filter_by_team(4)
		expect(employees.length).not_to be([])
	end

	
end
