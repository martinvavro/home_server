class ApplicationController < ActionController::Base
  # temporary measure before user control
  skip_before_action :verify_authenticity_token
end
