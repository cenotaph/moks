class Admin::BudgetareasController < Admin::BaseController
  def create
    create! { admin_budgetareas_path }
  end

  def update
    update! { admin_budgetareas_path }
  end

  def destroy
    destroy! { admin_budgetareas_path }
  end

  protected

  def permitted_params
    params.permit(:budgetarea => [:name, :active])
  end
  
end
