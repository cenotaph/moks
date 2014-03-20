class ResidencyapplicationsController < ApplicationController
  

  def create
    @residencyapplication = Residencyapplication.new(resource_params)
    if verify_recaptcha(:model => @residencyapplication, :message => "Oh! It's error with the CAPTCHA!") && @residencyapplication.save
      flash[:notice] = t(:application_submitted)
      redirect_to '/'
    else
      flash[:error] = t(:error_with_application)
      flash.delete(:recaptcha_error)
      render :template => 'residencyapplications/new'
    end
  end
  
  def index
    redirect_to '/'
  end

  def new
    @residencyapplication = Residencyapplication.new
  end

  protected

  def resource_params
    params.require(:residencyapplication).permit( [ :name, :organisation, :email, :address1, :address2, :city, :county, :postcode, :country_of_residence, :country_of_origin, :gender, :contact_phone, :field_of_interest, :urls, :languages_spoken, :cv, :other_attachment, :preferred_dates, :funny_question, :other_questions, :how_did_hear, :reason, :residencytype_id])
  end

end
