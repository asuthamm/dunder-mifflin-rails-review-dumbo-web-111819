class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        # byebug
        @employee = Employee.new
 
            
    end

    def create
        # byebug
        employee = Employee.create(employee_params)
        # byebug
        if employee.id == nil
            flash[:errors] = employee.errors.full_messages
        
            redirect_to "/employees/new"
        else
            redirect_to "/employees"
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        employee = Employee.find(params[:id])
        employee.update(employee_params)
        redirect_to "/employees/#{employee.id}"

    end

    private 

    def employee_params
        employee_params = params.require(:employee).permit( :first_name, :last_name, :alias, :title, :office, :dog_id)
    end
end
