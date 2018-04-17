class LeavedaysController < ApplicationController
	def index
		@year = if params[:year] 
			params[:year].to_i 
		else 
			Time.now.year 
		end
		@month = if params[:month] 
			params[:month].to_i 
		else 
			Time.now.month 
		end

		@month_str = @month > 9 ? @month.to_s : '0'+@month.to_s

		@leavedays = Employee.select('id', 'fullname', 'leave_datetime', 'leave_hour', 'leave_reason').joins('INNER JOIN leavedays ON employees.id = leavedays.employee_id').where("employees.del_flag = ? AND strftime('%m',leave_datetime) = ? AND strftime('%Y',leave_datetime) = ?", 0, @month_str, @year.to_s)
		@employees = Employee.select('id', 'fullname').where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order('id DESC')

		@demo = Employee.select('leavedays.id', 'fullname', 'leave_datetime', 'leave_hour', 'leave_reason', 'employee_id', 'leavedays.del_flag').joins('INNER JOIN leavedays ON employees.id = leavedays.employee_id').where("employees.del_flag = ? AND strftime('%m',leave_datetime) = ? AND strftime('%Y',leave_datetime) = ?", 0, @month_str, @year.to_s).paginate(:page => params[:page], :per_page => 10).order('employees.id DESC')

	end

	def new
		@leaveday = Leaveday.new
	end

	def create
		@leaveday = Leaveday.new(leaveday_params)
		if (@leaveday.save)
			flash[:success] = "Add new leave day success!"
			redirect_to leavedays_month_path 
		end

	end

	def edit
		@leaveday = Leaveday.find(params[:id])		
	end

	def update
		@leaveday = Leaveday.find(params[:id])		
		if (@leaveday.update(leaveday_params))
			flash[:success] = "Edit success!"
			redirect_to leavedays_month_path
		else
			render 'edit'
		end
	end

	private def leaveday_params
		params.require(:leaveday).permit(:employee_id, :leave_datetime, :leave_hour, :leave_reason, :del_flag)
	end
end
