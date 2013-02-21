class Admin::RegistrationsController < Admin::BaseController
  def index
    @registrations = Registration.all
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      redirect_to [:admin, @registration], :notice => "Successfully created registration."
    else
      render :action => 'new'
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(params[:registration])
      redirect_to [:admin, @registration], :notice  => "Successfully updated registration."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to admin_registrations_url, :notice => "Successfully destroyed registration."
  end
end
