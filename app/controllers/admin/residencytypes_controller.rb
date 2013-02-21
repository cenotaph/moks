class Admin::ResidencytypesController < Admin::BaseController
  def index
    @residencytypes = Residencytype.all
  end

  def show
    @residencytype = Residencytype.find(params[:id])
  end

  def new
    @residencytype = Residencytype.new
  end

  def create
    @residencytype = Residencytype.new(params[:residencytype])
    if @residencytype.save
      redirect_to [:admin, @residencytype], :notice => "Successfully created residencytype."
    else
      render :action => 'new'
    end
  end

  def edit
    @residencytype = Residencytype.find(params[:id])
  end

  def update
    @residencytype = Residencytype.find(params[:id])
    if @residencytype.update_attributes(params[:residencytype])
      redirect_to [:admin, @residencytype], :notice  => "Successfully updated residencytype."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @residencytype = Residencytype.find(params[:id])
    @residencytype.destroy
    redirect_to admin_residencytypes_url, :notice => "Successfully destroyed residencytype."
  end
end
