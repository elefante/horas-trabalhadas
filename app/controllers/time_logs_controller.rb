class TimeLogsController < ApplicationController
  before_filter :setup_variables

  # GET /time_logs/new
  # GET /time_logs/new.xml
  def new
    @time_log = TimeLog.new
    @time_log.user = @current_user
    @time_log.task_date = Date.today

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_log }
    end
  end

  # GET /time_logs/1/edit
  def edit
    @time_log = TimeLog.find(params[:id])
    params[:project_id] = @time_log.task_type.project.id
  end

  # POST /time_logs
  # POST /time_logs.xml
  def create
    @time_log = TimeLog.new(params[:time_log])

    respond_to do |format|
      if @time_log.save
        flash[:notice] = 'Registro de trabalho criado com sucesso!'
        format.html { redirect_to(:action => "new", :project_id => @time_log.task_type.project.id) }
        format.xml  { render :xml => @time_log, :status => :created, :location => @time_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_logs/1
  # PUT /time_logs/1.xml
  def update
    @time_log = TimeLog.find(params[:id])

    respond_to do |format|
      if @time_log.update_attributes(params[:time_log])
        flash[:notice] = 'Registro de tempo atualizado com sucesso!'
        format.html { redirect_to(:action => "new", :project_id => @time_log.task_type.project.id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_logs/1
  # DELETE /time_logs/1.xml
  def destroy
    @time_log = TimeLog.find(params[:id])
    @time_log.destroy
    flash[:notice] = 'Registro removido com sucesso!'

    respond_to do |format|
      format.html { redirect_to(time_logs_url) }
      format.xml  { head :ok }
    end
  end

  private

  def setup_variables
    @time_logs = TimeLog.find :all, :conditions => { :user_id => @current_user.id }, :order => " task_date desc"
    @projects = @current_user.projects
    @task_types = params[:project_id] ? TaskType.find_all_by_project_id(params[:project_id]) : []
  end
end
