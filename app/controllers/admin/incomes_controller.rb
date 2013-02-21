class Admin::IncomesController < Admin::BaseController
  def new
    if params[:invoice_id]
      @income = Income.new(:invoice_id => Invoice.find(params[:invoice_id]).id)

    else
      @income = Income.new
    end
  end

  def index
    @incomes = Income.filter(:params => params, :filter => :income_filter)
  end

  def create
    create! { admin_incomes_path }
  end

  def update
    update! { admin_incomes_path }
  end

  def destroy
    destroy! { admin_incomes_path }
  end

end
