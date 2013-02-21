class Admin::BudgetareasController < Admin::BaseController
  def index
    @budgetareas = Budgetarea.all
  end

  def show
    @budgetarea = Budgetarea.find(params[:id])
  end

  def new
    @budgetarea = Budgetarea.new
  end

  def create
    @budgetarea = Budgetarea.new(params[:budgetarea])
    if @budgetarea.save
      redirect_to [:admin, @budgetarea], :notice => "Successfully created budgetarea."
    else
      render :action => 'new'
    end
  end

  def edit
    @budgetarea = Budgetarea.find(params[:id])
  end

  def update
    @budgetarea = Budgetarea.find(params[:id])
    if @budgetarea.update_attributes(params[:budgetarea])
      redirect_to [:admin, @budgetarea], :notice  => "Successfully updated budgetarea."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @budgetarea = Budgetarea.find(params[:id])
    @budgetarea.destroy
    redirect_to admin_budgetareas_url, :notice => "Successfully destroyed budgetarea."
  end
end
