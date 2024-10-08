class ExpensesController < ApplicationController
    def index
        
        @names = Employee.pluck(:name)
        @expense = Expense.new
        @filter = params[:filter]
        if @filter == 'all' || @filter.nil?
            @expenses = Expense.all
        elsif @filter == 'approved'
            @expenses = Expense.where(status: 'approved')
        elsif @filter == 'pending'
            @expenses = Expense.where(status: 'pending')
        elsif @filter == 'rejected'
            @expenses = Expense.where(status: 'rejected')
        end
    end
    def create
        
        @employee = Employee.find_by(name: expense_params[:claimer])
        @employee.expenses.create(date: expense_params[:date], description: expense_params[:description], amount: expense_params[:amount])
        redirect_to root_path
        
    end

    def update
        @expense = Expense.find(params[:id])
        @expense.update(expense_update_params)
        redirect_to expenses_path
    end

    def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        redirect_to expenses_path
    end

    def approve
        @expense = Expense.find(params[:id])
        @expense.approve
        redirect_to expenses_path
    end
    def reject
        @expense = Expense.find(params[:id])
        @expense.reject
        redirect_to expenses_path

    end

    def stats
        @expenses_per_month = Expense.sum_amount_per_month.map do |exp|
            {
              label: exp.month.strftime("%B %Y"), # Format month as readable
              value: exp.total_amount
            }
        end
        
          # Prepare data for Chartkick
        @expenses_per_month_chart_data = @expenses_per_month.map do |exp|
            [exp[:label], exp[:value]]
        end
    end

    private
    def expense_params
        params.require(:expense).permit(:claimer,:date,:description,:amount)
        
    end
    def expense_update_params
        params.require(:expense).permit(:date,:description,:amount) 
    end
end
