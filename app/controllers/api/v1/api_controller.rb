class Api::V1::ApiController < ApplicationController
  include AuthenticateRequestConcern, SetErrorConcern
  layout "api/v1/application"
  before_action :set_jbuilder_defaults

  def authenticate_owner_resource(resource)
    if resource.user_id != current_user.id
      error!("No tiene permisos para eliminar el link",:unauthorized)
    end
  end

end
