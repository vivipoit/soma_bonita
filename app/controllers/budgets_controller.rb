class BudgetsController < ApplicationController

  def new
    @budget = Budget.new
  end
  def create
    budget_params = params.require(:budget).permit(:start_date,:end_date,:tour_name,:quantity_adults,:quantity_children,:quantity_babies)
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to @budget
    else
      flash[:error] = "Preencha os Campos Obrigatorios"
      render new_budget_path
    end
  end
  def show
    @budget = Budget.find(params[:id])
  end
end
