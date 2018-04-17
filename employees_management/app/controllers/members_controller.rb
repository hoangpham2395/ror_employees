class MembersController < ApplicationController
	def index
		@demos = Member.all.where(del_flag: 0)

		@projects = Project.select('id', 'project_name', 'project_status').where(del_flag: 0)		
		@members = Member.select('project_id', 'employees.fullname', 'user_type', 'join_status', 'employee_id').joins('INNER JOIN employees ON members.employee_id = employees.id').where('members.del_flag = ?', 0)
		
	end

	def show
		@member = Member.find(params[:id])
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.new(member_params)
		if (@member.save)
			flash[:success] = "Insert success!"
			redirect_to members_path
		else
			render 'new'
		end
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if (@member.update(member_params))
			flash[:success] = 'Edit success!'
			redirect_to members_path
		else
			render 'edit'
		end
	end

	def destroy
		if Member.update(params[:id], :del_flag => 1)
			flash[:success] = "Delete success!"
		end
		redirect_to @members_path
	end

	private def member_params
		params.require(:member).permit(:project_id, :employee_id, :user_type, :join_status,:del_flag)
	end
end
