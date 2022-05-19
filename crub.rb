class EmployeesController < ActionController::Base

    def index
        @employees = Employee.all
    end
  
    def new
        @employee = Employee.new
    end  
   


    def create
        @employee = Employee.new(employee_params)
        
        if @employee.save
            redirect_to new_employee_path
        else
            render :new
        end
    end

  

    def edit
        @employee = Employee.find(params[:id])
      end
    
      def update
        @employee = Employee.find(params[:id])
    
        if @employee.update(employee_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end





    def destroy
    @employee = Employee.find_by(params[:id])
    @employee.destroy
    redirect_to root_path
    end





    private
    def employee_params
        params.require(:employee).permit(:name, :salary, :city)
    end

    

end