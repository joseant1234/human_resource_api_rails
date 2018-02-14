class Api::V1::CertificationsController < Api::V1::ApiController
  before_action :set_employee, only: [:create]

  def create
    @certification = @employee.certifications.new(certification_params)

    if @certification.save
      render :show, status: :created
    else
      error_array!(@certification.erros.full_messages,:unprocessable_entity)
    end
  end

  def update
  end

  def destroy

  end


  private
  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_certification
    @certification = Certification.find(params[:id])
  end

  def certification_params
    params.require(:certification).permit(:title,:year)
  end
end
