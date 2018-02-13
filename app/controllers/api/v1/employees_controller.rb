class Api::V1::EmployeesController < Api::V1::ApiController
  before_action :authenticate_request!
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.all
    render template: "api/v1/employees/index"
  end

  def show
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render template: "api/v1/employees/show"
    else
      #render json: {errors: @employee.errors.full_messages}, status: :unprocessable_entity
      error_array!(@employee.errors.full_messages,:unprocessable_entity)
    end
  end

  def update
    if @employee.update(employee_params)
      render template: "api/v1/employees/show"
    else
      error_array!(@employee.errors.full_messages,:unprocessable_entity)
    end
  end

  def destroy
    @employee.destroy
    render "api/v1/employees/show"
  end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name,:last_name,:area,:position,:summary,:photo)
  end

end
