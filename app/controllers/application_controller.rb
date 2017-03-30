class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :get_tours

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def get_tours
    @tours = Tour.all.order('name ASC')
  end
end
