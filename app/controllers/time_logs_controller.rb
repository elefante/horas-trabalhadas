class TimeLogsController < ApplicationController
  # GET /time_logs
  # GET /time_logs.xml
  def index
    @time_logs = TimeLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_logs }
    end
  end

  # GET /time_logs/1
  # GET /time_logs/1.xml
  def show
    @time_log = TimeLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_log }
    end
  end

  # GET /time_logs/new
  # GET /time_logs/new.xml
  def new
    @time_log = TimeLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_log }
    end
  end

  # GET /time_logs/1/edit
  def edit
    @time_log = TimeLog.find(params[:id])
  end

  # POST /time_logs
  # POST /time_logs.xml
  def create
    @time_log = TimeLog.new(params[:time_log])

    respond_to do |format|
      if @time_log.save
        flash[:notice] = 'TimeLog was successfully created.'
        format.html { redirect_to(@time_log) }
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
        flash[:notice] = 'TimeLog was successfully updated.'
        format.html { redirect_to(@time_log) }
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

    respond_to do |format|
      format.html { redirect_to(time_logs_url) }
      format.xml  { head :ok }
    end
  end
end
