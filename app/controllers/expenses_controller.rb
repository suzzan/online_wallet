class ExpensesController < ApplicationController
    def index
        @expenses = Expense.all
        
    end
    
  
    def create
        @expenses = Expense.create(expense_params)
        if @expenses.valid?
            flash[:success] = "Your expense is recorded!"
        else
            flash[:alert] = "Woops! Looks like there has been an error!"
        end
        redirect_to root_path
    end
      
    def edit
        @expenses = Expense.find(params[:id])
   
    end
    
    def update
        @expense = Expense.find(params[:id])
        if@expense.update(expense_params)
            flash[:success] = "The details has been updated!"
            redirect_to root_path 
        else
            flash[:alert] = "Woops! Looks like there has been an error!"
            redirect_to edit_expense_path(params[:id])
        end
        
    end
    
    def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        flash[:success] = "Successfully deleted!"
        redirect_to root_path
        
    end
    
    private
    
        def expense_params
             
            params.require(:expense).permit(:description, :amount, :date)
        end

end

