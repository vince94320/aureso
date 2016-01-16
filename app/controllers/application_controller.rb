class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :force_json_format

  private
  def force_json_format
    request.format = :json
  end
end
