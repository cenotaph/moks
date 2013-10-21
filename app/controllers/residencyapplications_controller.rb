class ResidencyapplicationsController < InheritedResources::Base
  actions :create, :new, :submit 

  def create
    create! {
      flash[:notice] = t(:application_submitted)
      '/'
    }
  end
  
  def index
    redirect_to '/'
  end


  protected

  def permitted_params
    params.permit(:residencyapplication => [ :name, :organisation, :email, :address1, :address2, :city, :county, :postcode, :country_of_residence, :country_of_origin, :gender, :contact_phone, :field_of_interest, :urls, :languages_spoken, :cv, :other_attachment, :preferred_dates, :funny_question, :other_questions, :how_did_hear, :reason, :residencytype_id])
  end

end
