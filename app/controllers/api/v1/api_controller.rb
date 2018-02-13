class Api::V1::ApiController < ApplicationController
  include AuthenticateRequestConcern, SetErrorConcern
  layout "api/v1/application"
  before_action :set_jbuilder_defaults

end
