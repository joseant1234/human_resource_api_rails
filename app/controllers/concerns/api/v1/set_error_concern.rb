module Api::V1::SetErrorConcern extend ActiveSupport::Concern

  protected
  def set_jbuilder_defaults
    @errors = []
  end

  def error!(message,status)
    @errors << message
    response.status = status
    render template: "api/v1/errors"
  end

  def error_array!(array,status)
    @errors = @errors + array
    response.status = status
    render "api/v1/errors"
  end
end
