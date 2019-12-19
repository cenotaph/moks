class Admin::HomeController < ApplicationController

  layout 'admin'
  before_action :authenticate_user!
  #load_and_authorize_resource
  check_authorization
  # load_and_authorize_resource
  skip_authorization_check
  # skip_before_filter :require_no_authentication

  def index


  end

end