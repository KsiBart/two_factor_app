class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_user
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  # GET /employees
  # GET /employees.json
  def index
    @employees = @user.employees.order(sort_column + " " + sort_direction)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = @user.employees.find(params[:id])
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = @user.employees.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to [@user, @employee], notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: [@user, @employee]}
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to [@user, @employee], notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: [@user, @employee] }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def sort_column
      Employee.column_names.include?(params[:sort]) ? params[:sort] : "lastname"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def get_user
      @user = current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = @user.employees.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:firstname, :midname, :lastname, :pesel, :address, :city, :state, :postal, :country, :phone, :gender, :department, :birthdate, :hiredate, :email, :hrsperweek, :wage, :nationality, :marital)
    end
end
