class TaskTypesController < ApplicationController

  # Method to populate tasks on /views/time_logs/_form.html.erb using AJAX
  def index
    @task_types = TaskType.find_all_by_project_id params[:project_id]
    respond_to do |format|
      format.js { render :layout => false, :inline => "<option></option><%= options_from_collection_for_select @task_types, :id, :name, params[:project_id] %>" }
    end
  end

  # GET /task_types/1
  # GET /task_types/1.xml
  def new
    @task_type = TaskType.new
    @task_type.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task_type }
    end
  end

  # GET /task_types/1/edit
  def edit
    @task_type = TaskType.find(params[:id])
  end

  # POST /task_types
  # POST /task_types.xml
  def create
    @task_type = TaskType.new(params[:task_type])

    respond_to do |format|
      if @task_type.save
        flash[:notice] = 'Tipo de tarefa criado com sucesso!'
        format.html { redirect_to(@task_type.project) }
        format.xml  { render :xml => @task_type, :status => :created, :location => @task_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_types/1
  # PUT /task_types/1.xml
  def update
    @task_type = TaskType.find(params[:id])

    respond_to do |format|
      if @task_type.update_attributes(params[:task_type])
        flash[:notice] = 'Tipo de tarefa atualizada com sucesso!'
        format.html { redirect_to(@task_type.project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_types/1
  # DELETE /task_types/1.xml
  def destroy
    @task_type = TaskType.find(params[:id])
    @task_type.destroy
    flash[:notice] = 'Tipo de tarefa removido com sucesso!'
    respond_to do |format|
      format.html { redirect_to(task_types_url) }
      format.xml  { head :ok }
    end
  end
end
