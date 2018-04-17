class EmployeesController < ApplicationController
	def index
		@employees = if params[:fullname] || params[:email_company] || params[:birthday] || params[:gender] || params[:tel] || params[:department] || params[:position] || params[:user_type] || params[:status] || params[:join_datetime]
			Employee.select('id, username, fullname, email_company, tel, gender, birthday, department, position, status, join_datetime').where('fullname LIKE ? AND email_company LIKE ? AND birthday LIKE ? AND gender LIKE ? AND tel LIKE ? AND department LIKE ? AND position LIKE ? AND user_type LIKE ? AND status LIKE ? AND join_datetime LIKE ?', "%#{params[:fullname]}%", "%#{params[:email_company]}%", "%#{params[:birthday]}%", "%#{params[:gender]}%", "%#{params[:tel]}%", "%#{params[:department]}%", "%#{params[:position]}%", "%#{params[:user_type]}%", "%#{params[:status]}%", "%#{params[:join_datetime]}%").where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order('id DESC')
		else
			Employee.select('id, username, fullname, email_company, tel, gender, birthday, department, position, status, join_datetime').where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order('id DESC')
		end
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		if (@employee.save)
			flash[:success] = "Add new employee success!"
			redirect_to employees_path
		else
			render 'new'
		end
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
		if (@employee.update(employee_params))
			flash[:success] = "Update success!"
			redirect_to employees_path
		else
			render 'edit'
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		flash[:success] = 'Delete success!'
		redirect_to employees_path
	end

	def all_leavedays
		@employees = Employee.select('id', 'fullname', 'join_datetime', 'leavedays_have', 'leavedays_took', 'leavedays_note').where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order('id DESC')
	end

	def update_leavedays
		if !params[:leavedays_have].nil?
			Employee.update(params[:id], :leavedays_have => params[:leavedays_have])
		end

		if !params[:leavedays_took].nil?
			Employee.update(params[:id], :leavedays_took => params[:leavedays_took])
		end 

		if !params[:leavedays_note].nil?
			Employee.update(params[:id], :leavedays_note => params[:leavedays_note])
		end 
			
		flash[:success] = 'Edit success!'
		redirect_to all_leavedays_path
	end

	private def employee_params
		params.require(:employee).permit(:username, :fullname, :email_company, :email_personal, :tel, :gender, :birthday, :avatar, :department, :position, :skill, :user_type, :literacy, :contract_type, :status, :address, :bank_account, :id_number, :description, :join_datetime, :exit_datetime, :leavedays_have, :leavedays_took, :leavedays_note, :del_flag)
	end
end