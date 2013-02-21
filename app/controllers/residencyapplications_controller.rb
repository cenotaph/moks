class ResidencyapplicationsController < ApplicationController
  def index
    @residencyapplications = Residencyapplication.all
  end

  def show
    @residencyapplication = Residencyapplication.find(params[:id])
  end

  def new
    @residencyapplication = Residencyapplication.new
  end

  def create
    @residencyapplication = Residencyapplication.new(params[:residencyapplication])
    if @residencyapplication.save
      redirect_to @residencyapplication, :notice => "Successfully created residencyapplication."
    else
      render :action => 'new'
    end
  end

  def edit
    @residencyapplication = Residencyapplication.find(params[:id])
  end

  def update
    @residencyapplication = Residencyapplication.find(params[:id])
    if @residencyapplication.update_attributes(params[:residencyapplication])
      redirect_to @residencyapplication, :notice  => "Successfully updated residencyapplication."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @residencyapplication = Residencyapplication.find(params[:id])
    @residencyapplication.destroy
    redirect_to residencyapplications_url, :notice => "Successfully destroyed residencyapplication."
  end
end
