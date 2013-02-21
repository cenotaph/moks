class RegistrationsController < Devise::RegistrationsController

  def build_resource(*args)
    super
    if session[:omniauth]
      #If a user with this email already exists then use them instead
      existing_user = User.find_by_email(@user.email)
      if(existing_user)
          existing_user.email = @user.email
          @user = existing_user
      end
      #If there is a session available, we know it contains data for adding an authentication
      @user.apply_omniauth(session[:omniauth])
      #Ensure validations are passed on to next page
      @user.valid?
    end
  end

end