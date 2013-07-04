class Admin::IncomesController < Admin::BaseController
  def new
    if params[:invoice_id]
      @income = Income.new(:invoice_id => Invoice.find(params[:invoice_id]).id)

    else
      @income = Income.new
    end
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

  protected

  def permitted_params
    params.permit(:income => [:attachable_type, :attachable_id,  :date_received, 
                               :invoice_id, :recipient, :what_for, 
                               :event_id, :funder_id, :project_id, :amount, :hidden, :source, 
                               :budgetarea_id, :has_receipt,
                               documents_attributes: [:id, :_destroy, :attachment, :name, :description]
                                ])
    
  end

end
