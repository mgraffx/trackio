class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # In application_controller.rb

  before_filter :add_allow_credentials_headers

  def add_allow_credentials_headers
  # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#section_5
  #
  # Because we want our front-end to send cookies to allow the API to be authenticated
  # (using 'withCredentials' in the XMLHttpRequest), we need to add some headers so
  # the browser will not reject the response
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def options
    head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

end
