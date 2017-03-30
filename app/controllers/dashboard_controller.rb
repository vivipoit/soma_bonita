class DashboardController < ActionController::Base
  layout "admin_application"
  before_action :authenticate_user!
  def show

  end
end
