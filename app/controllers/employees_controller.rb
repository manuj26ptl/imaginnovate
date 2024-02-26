class EmployeesController < ApplicationController
  before_action :set, only: [:show, :edit, :update, :destroy]
  def index
    @employees=Employee.all
  end

  def new
    @employee =Employee.new
    2.times { @employee.phone_numbers.build }

    
  end

  def create
    employee = Employee.create(employee_params)
    if employee.valid?
      flash[:notice] = "Employee is successfully added."
      redirect_to employees_path
    else
      flash[:errors] = employee.errors.full_messages
      redirect_to new_employee_path(employee)
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Employee is successfully updated."
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employees_path
    end
  end

  def show
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def set
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:employee_id, :first_name, :last_name, :email, :salary, :date_of_joining, phone_numbers_attributes: [:phone_number])
  end
end
