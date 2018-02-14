class Api::V1::SkillsController < Api::V1::ApiController
  before_action :authenticate_request!
  before_action :set_skill, only: [:show]

  def index
    @skills = Skill.all
    render :index
  end

  def show
  end

  private
  def set_skill
    @skill = Skill.find(params[:id])
  end

end
