require 'rails_helper'

module Api
  module V1
    RSpec.describe EmployeesController, :type => :controller do

      let(:valid_attributes){
        {first_name: "Nuevo nombre de employee", last_name: "Nuevo apellido de employee",
         position: 'developer', team_id: 1, summary: "summary del employee",
         photo: Rack::Test::UploadedFile.new(File.new("#{Rails.root}/spec/support/example.jpg"))
        }
      }

      describe "GET #index" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          request.headers["Accept"] = "application/json"
        end

        it "response ok" do
          get :index
          expect(response).to have_http_status(200)
        end
      end

      describe "POST #create" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          #request.headers["Accept"] = "application/json"
        end

        context "with valid params" do
          it "creates new employee" do
            expect{
              post :create, :params => { employee: valid_attributes }
            }.to change(Employee, :count).by(1)
          end
        end
      end

    end
  end
end
