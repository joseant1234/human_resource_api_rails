class Api::V1::EmployeesController < Api::V1::ApiController
  before_action :authenticate_request!
  before_action :set_employee, only: [:show, :update, :destroy, :download]

  def index
    @employees = Employee.includes(:team).paginate(page: params[:page], per_page: 2)

    if params[:position].present?
      @employees = @employees.filter_by_position(params[:position])
    end

    if params[:team_id].present?
      @employees = @employees.filter_by_team(params[:team_id])
    end

    if params[:start_date].present?
      @employees = @employees.filter_by_start_on(params[:start_date])
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

  def download
    #@employee.resume = StringIO.new(generate_pdf("api/v1/employees/resume.html.erb")) #mimic a real upload file
    #@employee.resume = WickedPdf.new.pdf_from_string('<h1>Hola</h1>')

    # create an instance of ActionView, so we can use the render method outside of a controller
    av = ActionView::Base.new()
    av.view_paths = ActionController::Base.view_paths

    # need these in case your view constructs any links or references any helper methods.
    # av.class_eval do
    #   include Rails.application.routes.url_helpers
    #   include ApplicationHelper
    # end

    pdf_html = av.render template: 'api/v1/employees/resume', layout: 'layouts/api/v1/pdf', locals: {employee: @employee}

    # use wicked_pdf gem to create PDF from the doc HTML
    doc_pdf = WickedPdf.new.pdf_from_string(
      pdf_html,
      page_size: 'Letter',
      javascript_delay: 6000
    )

    # save PDF to disk
    pdf_path = Rails.root.join('tmp/reports', "#{@employee.id}_#{Date.today.iso8601}.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end

    @employee.resume = File.open pdf_path
    @employee.save!

    # The report has now been saved elsewhere using Paperclip; we don't need to store it locally
    File.delete(pdf_path) if File.exist?(pdf_path)
    #@employee.save
    render "api/v1/employees/show"
  end

     def generate_pdf(pdf)
      html = render_to_string(:pdf => pdf,
        :template => pdf,
        :layout => 'api/v1/pdf.html.erb',
        :encoding => 'UTF-8',
        :page_size        => 'A4',
        :dpi              => '300',
        :print_media_type => true,
        :no_background    => true,
        :margin => {
                :top => 50,
                :bottom => 25
             },
        :header => { :html => { :template => '' },
                     :spacing => 10,
                     :margin => {
                             :top => 40
                          }
                   },
        :footer => { :html => { :template => '' } }
      )
    end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :first_name,:last_name,:team_id,:position,
      :summary,:photo, :collegue,:degree,
      employee_languages_attributes: [:id, :language, :level, :_destroy],
      employee_skills_attributes: [:id, :skill_id, :_destroy],
      employee_soft_skills_attributes: [:id, :soft_skill, :_destroy],
      employee_certifications_attributes: [:id, :certification,:date, :_destroy],
      employee_interests_attributes: [:id, :interest, :_destroy],
      employee_projects_attributes: [:id, :start_date, :end_date, :role, :title, :_destroy,
        employee_project_responsabilities_attributes: [:id, :responsability, :_destroy],
        employee_project_skills_attributes: [:id, :skill_id, :_destroy]])

  end

end
