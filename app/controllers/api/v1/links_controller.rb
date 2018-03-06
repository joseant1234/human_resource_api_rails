class Api::V1::LinksController < Api::V1::ApiController
  before_action :authenticate_request!
  before_action :set_link, only: [:show, :destroy]
  before_action(only: [:destroy]) { |controlador| controlador.authenticate_owner_resource(@link) }
  before_action :authorization_to_show_link, only: [:show]

  def index
    @links = @current_user.links
    render :index
  end

  def create
    @link = @current_user.links.new
    @link.build_from_params(params[:skills])
    if @link.save
      render :show
    else
      error_array!(@link.errors.full_messages,:unprocessable_entity)
    end
  end

  def show
    @skills_names = @link.skills.order_by_name.pluck(:name)
    @employees = Employee.filter_by_skills(@skills_names)
    render :show
  end

  def destroy
    @link.destroy
    render :show
  end

  private
  def set_link
    @link = Link.find_by_url(params[:id])
  end

  def authorization_to_view_link
    error!("Ya expiró el link",:unauthorized) if @link.expiration_date < Date.today
  end

end
