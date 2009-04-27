class TaskTypesController < ApplicationController
  # GET /task_types
  # GET /task_types.xml
  def index
    @task_types = TaskType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @task_types }
    end
  end

  # GET /task_types/1
  # GET /task_types/1.xml
  def show
    @task_type = TaskType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task_type }
    end
  end

  # GET /task_types/new
  # GET /task_types/new.xml
  def new
    @task_type = TaskType.new

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
        flash[:notice] = 'TaskType was successfully created.'
        format.html { redirect_to(@task_type) }
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
        flash[:notice] = 'TaskType was successfully updated.'
        format.html { redirect_to(@task_type) }
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

    respond_to do |format|
      format.html { redirect_to(task_types_url) }
      format.xml  { head :ok }
    end
  end
end
