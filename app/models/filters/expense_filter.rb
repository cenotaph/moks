class ExpenseFilter < WillFilter::Filter
  def model_class
    Expense
  end
end