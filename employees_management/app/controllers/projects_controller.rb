class ProjectsController < ApplicationController
	def index
    	@projects = if params[:project_name]
            # Project.select('projects.id', 'projects.project_name', 'projects.project_lang', 'projects.project_status', 'projects.start_datetime', 'projects.end_datetime', 'employees.fullname', 'members.user_type').joins("INNER JOIN members ON projects.id = members.project_id INNER JOIN employees ON employees.id = members.employee_id").where('projects.project_name LIKE ? AND projects.del_flag = ? AND members.user_type = ?', "%#{params[:project_name]}%", 0, 0).paginate(:page => params[:page], :per_page => 10).order("projects.id DESC")
            Project.select('id', 'project_name', 'project_status', 'project_lang', 'start_datetime', 'end_datetime').where('projects.project_name LIKE ? AND del_flag = ? ', "%#{params[:project_name]}%", 0).paginate(:page => params[:page], :per_page => 10).order("id DESC")
    	else
            # Project.select('projects.id', 'projects.project_name', 'projects.project_lang', 'projects.project_status', 'projects.start_datetime', 'projects.end_datetime', 'employees.fullname', 'members.user_type').joins("INNER JOIN members ON projects.id = members.project_id INNER JOIN employees ON employees.id = members.employee_id").where('projects.del_flag = ? AND members.user_type = ?', 0, 0).paginate(:page => params[:page], :per_page => 10).order("projects.id DESC")
            Project.select('id', 'project_name', 'project_status', 'project_lang', 'start_datetime', 'end_datetime').where(del_flag: 0).paginate(:page => params[:page], :per_page => 10).order("id DESC")
    	end
    end

    def new
    	@project = Project.new
    	@users = Employee.select('fullname', 'id').where(del_flag: 0)
    end

    def show
    	@project = Project.find(params[:id])
        @leader = Employee.select('fullname').joins('INNER JOIN members ON employees.id = members.employee_id').where('members.project_id = ? AND members.del_flag = ? AND members.user_type = ?', params[:id], 0, 0)
        @members = Employee.select('fullname').joins('INNER JOIN members ON employees.id = members.employee_id').where('members.project_id = ? AND members.del_flag = ? AND members.user_type = ?', params[:id], 0, 1)
    end

    def create
    	@project = Project.new(project_params)

    	if @project.save
    		flash[:success] = "Insert success!"
    		redirect_to projects_path
    	else
    		render 'new'
    	end
    end

    def edit
    	@project = Project.find(params[:id])
    end

    def update
    	@project = Project.find(params[:id])
    	if @project.update(project_params)
    		flash[:success] = 'Edit success!'
    		redirect_to projects_path
    	else
    		render 'edit'
    	end
    end

    def destroy
    	# @project = Project.find(params[:id])
    	if (Project.update(params[:id], :del_flag => 1))
    		flash[:success] = "Delete success!"
    	end
    	redirect_to projects_path
    end

    private def project_params
        params.require(:project).permit(:project_name, :project_status, :start_datetime, :end_datetime, :project_lang, :description, :del_flag)
    end
end
