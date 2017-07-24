class ExpensesController < ApplicationController
  def new
    @user = current_user

  end

  def create

    @expense = current_user.expenses.new(expense_params)
    @expense.save
    redirect_to user_expenses_path(current_user)

  end
  def index
    @user = current_user
    @total_amount = @user.expenses.sum(:amount)
  end

  private

  def expense_params
    params.require(:expenses).permit(:description, :amount, :student_id)
  end

end
