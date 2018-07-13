class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_dev

  def current_dev
    session[:dev_id].nil? ? nil : Developer.find(session[:dev_id])
  end
end
