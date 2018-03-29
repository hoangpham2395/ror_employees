class UsersController < ApplicationController

	# Get data from form
	private def user_params
		params.require(:user).permit(:username, :password, :fullname, :email_company, :email_personal, :tel, :gender, :birthday, :image, :department, :position, :skill, :user_type, :literacy, :contract_type, :status, :address, :bank_account, :id_number, :description, :join_datetime, :exit_datetime, :leavedays_have, :leavedays_took, :leavedays_note, :del_flag)
	end

	# def index
	# 	@users = User.select('id, username, fullname, email_company, tel, gender, birthday, department, position, status, join_datetime').where(del_flag: 0)
	# end

	def index
		@users = if params[:fullname] || params[:email_company] || params[:birthday] || params[:gender] || params[:tel] || params[:department] || params[:position] || params[:user_type] || params[:status] || params[:join_datetime]
			User.select('id, username, fullname, email_company, tel, gender, birthday, department, position, status, join_datetime').where('fullname LIKE ? AND email_company LIKE ? AND birthday LIKE ? AND gender LIKE ? AND tel LIKE ? AND department LIKE ? AND position LIKE ? AND user_type LIKE ? AND status LIKE ? AND join_datetime LIKE ?', "%#{params[:fullname]}%", "%#{params[:email_company]}%", "%#{params[:birthday]}%", "%#{params[:gender]}%", "%#{params[:tel]}%", "%#{params[:department]}%", "%#{params[:position]}%", "%#{params[:user_type]}%", "%#{params[:status]}%", "%#{params[:join_datetime]}%").where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order('id DESC')
		else
			User.select('id, username, fullname, email_company, tel, gender, birthday, department, position, status, join_datetime').where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order('id DESC')
		end
	end

	# def self.search(fullname)
	# 	if fullname
	# 	    where('fullname LIKE ?', "%#{fullname}%")
	# 	else
	# 	    all
	# 	end
	# end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

	    if (@user.save)
	      redirect_to users_path 
	    else
	      render 'new'
	      # redirect_to new_user_path
	    end 
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if (@user.update(user_params))
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end
end
