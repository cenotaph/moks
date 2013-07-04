class Admin::ExpensesController < Admin::BaseController
  def new
    if params[:invoice_id]
      @expense = Expense.new(:invoice_id => Invoice.find(params[:invoice_id]).id)

    else
      @expense = Expense.new
    end
  end


  def create
    create! { admin_expenses_path }
  end

  def update
    update! { admin_expenses_path }
  end

  def destroy
    destroy! { admin_expenses_path }
  end

  protected

  def permitted_params
    params.permit(:expense => [ :date_paid, :recipient, :what_for, :event_id, :project_id, 
                                :amount, :hidden, :paid_by, :budgetarea_id, :has_receipt,
                                documents_attributes: [ :id, :_destroy, :attachment, :name, :description],
                              ])
  end

end
