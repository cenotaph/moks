class Admin::ExpensesController < Admin::BaseController
  def new
    if params[:invoice_id]
      @expense = Expense.new(:invoice_id => Invoice.find(params[:invoice_id]).id)

    else
      @expense = Expense.new
    end
  end

  def index
    @expenses = Expense.filter(:params => params, :filter => :expense_filter)
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
end
