class ResidencyapplicationsController < InheritedResources::Base
  actions :create, :new, :submit 

  def index
    redirect_to '/'
  end

end
