class ProjectproposalsController < ApplicationController
  def index
    @projectproposals = Projectproposal.all
  end

  def show
    @projectproposal = Projectproposal.find(params[:id])
  end

  def new
    @projectproposal = Projectproposal.new
  end

  def create
    @projectproposal = Projectproposal.new(params[:projectproposal])
    if @projectproposal.save
      redirect_to @projectproposal, :notice => "Successfully created projectproposal."
    else
      render :action => 'new'
    end
  end

  def edit
    @projectproposal = Projectproposal.find(params[:id])
  end

  def update
    @projectproposal = Projectproposal.find(params[:id])
    if @projectproposal.update_attributes(params[:projectproposal])
      redirect_to @projectproposal, :notice  => "Successfully updated projectproposal."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @projectproposal = Projectproposal.find(params[:id])
    @projectproposal.destroy
    redirect_to projectproposals_url, :notice => "Successfully destroyed projectproposal."
  end
end
