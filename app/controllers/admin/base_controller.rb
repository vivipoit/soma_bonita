module Admin
  class BaseController < ApplicationController
    layout 'admin_application'
    before_action :authenticate_user!
  end
end
