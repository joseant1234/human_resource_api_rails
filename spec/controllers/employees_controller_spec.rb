require 'rails_helper'

module Api
  module V1
    RSpec.describe EmployeesController, :type => :controller do

      let(:valid_attributes){
        {first_name: "Nuevo nombre de employee", last_name: "Nuevo apellido de employee",
         position: 'developer', team_id: 1, summary: "summary del employee"
        }
      }
      let(:invalid_attributes){
        {first_name: "", last_name: ""}
      }
      let(:employee){FactoryBot.create(:employee)}

      # photo: Rack::Test::UploadedFile.new(File.new("#{Rails.root}/spec/support/example.jpg"))
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
        it "send employees list" do
          get :index
          expect(assigns(:employees)).not_to be([])
        end
      end

      describe "GET #show" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          request.headers["Accept"] = "application/json"
        end

        it "has value" do
          get :show, :params => {id: employee.id}
          expect(assigns(:employee).present?).to eq(true)
        end

        it "render to show template" do
          get :show, :params => {id: employee.id}
          expect(response).to render_template('show')
        end
      end

      describe "POST #create" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          request.headers["Accept"] = "application/json"
        end

        context "with valid params" do
          it "creates new employee" do
            expect{
              post :create, :params => { employee: valid_attributes }
            }.to change(Employee, :count).by(1)
          end
        end

        context "with invalid params" do
          it "doesnt create new employee" do
            expect{
              post :create, :params => { employee: invalid_attributes }
            }.to change(Employee, :count).by(0)
          end
        end
      end

      describe "PUT #update" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          request.headers["Accept"] = "application/json"
        end

        context "with valid params" do
          let(:new_attributes){
            {first_name: "new first name"}
          }
          it "update first_name of employee" do
            put :update, :params => { id: employee.id, employee: new_attributes }
            employee.reload
            expect(employee.first_name).to eq("new first name")
          end
          it "assigns the requested employee as employee" do
            put :update, :params => {:id => employee.id, :employee => valid_attributes}
            expect(assigns(:employee)).to eq(employee)
          end
          it "render the new employee in show view" do
            put :update, :params => {:id => employee.id, :employee => valid_attributes}
            expect(response).to render_template("show")
          end
        end

        context "with invalid params" do
          it "assigns the employee as @employee" do
            put :update, :params => {:id => employee.id, :employee => invalid_attributes}
            expect(assigns(:employee)).to eq(employee)
          end
          it "render to error template" do
            put :update, :params => {:id => employee.id, :employee => invalid_attributes}
            expect(response).to render_template("api/v1/errors")
          end
        end
      end

      describe "DELETE #destroy" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          request.headers["Accept"] = "application/json"
        end
        it "destroys the requested employee" do
          delete :destroy, :params => { id: employee.id }
          expect(Employee.find_by_id(assigns(:employee))).to eq(nil)
        end
      end

      describe "DOWNLOAD #download" do
        before do
          user = FactoryBot.create(:user)
          @jwt = JsonWebToken.encode({user_id: user.id})
          request.headers['Authorization'] = "Bearer #{@jwt}"
          request.headers["Accept"] = "application/json"
        end
        it "returns ok" do
          get :download, :params => { id: employee.id }
          expect(response).to be_successful
        end
        it "the file to donwload has a path" do
          get :download, :params => { :id => employee.id }
          expect(assigns(:employee).resume.file?).to be(true)
        end
      end
    end
  end
end
