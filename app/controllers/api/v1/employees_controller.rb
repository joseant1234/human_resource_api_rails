class Api::V1::EmployeesController < Api::V1::ApiController
  before_action :authenticate_request!
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.paginate(page: params[:page], per_page: 2)

    if params[:position].present?
      @employees = @employees.filter_by_position(params[:position])
    end

    if params[:area].present?
      @employees = @employees.filter_by_area(params[:area])
    end

    if params[:update].present?
      @employees = @employees.filter_by_start_on(params[:update])
    end

    if params[:year_min].present?
      @employees = @employees.filter_by_min_years_working(params[:year_min])
    end

    if params[:year_max].present?
      @employees = @employees.filter_by_max_years_working(params[:year_max])
    end

    if params[:skills].present?
      @employees = @employees.filter_by_skills(params[:skills])
    end

    render template: "api/v1/employees/index"
  end

  def show
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render template: "api/v1/employees/show", status: :created
    else
      #render json: {errors: @employee.errors.full_messages}, status: :unprocessable_entity
      error_array!(@employee.errors.full_messages,:unprocessable_entity)
    end
  end

  def update
    if @employee.update_attributes(employee_params)
      render template: "api/v1/employees/show", status: :ok
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
    params.require(:employee).permit(
      :first_name,:last_name,:area,:position,:summary,:photo,
      languages_attributes: [:id, :name, :institute, :_destroy],
      jobs_attributes: [:id, :workplace, :position, :enter_on, :finish_on, :_destroy],
      certifications_attributes: [:id, :title, :year, :_destroy],
      strengths_attributes: [:id, :name, :_destroy],
      area_interests_attributes: [:id, :name, :_destroy],
      degrees_attributes: [:id, :title, :university, :_destroy])
  end

end
