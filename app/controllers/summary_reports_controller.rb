class SummaryReportsController < ApplicationController
  # GET /summary_reports/1
  # GET /summary_reports/1.xml
  def show
    @summary_report = SummaryReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @summary_report }
    end
  end

  # GET /summary_reports/new
  # GET /summary_reports/new.xml
  def new
    @summary_report = SummaryReport.new
    @projects = Project.find :all
    @users = User.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @summary_report }
    end
  end

  # POST /summary_reports
  # POST /summary_reports.xml
  def create
    @summary_report = SummaryReport.new(params[:summary_report])

    respond_to do |format|
      if @summary_report.save
        flash[:notice] = 'SummaryReport was successfully created.'
        format.html { redirect_to(@summary_report) }
        format.xml  { render :xml => @summary_report, :status => :created, :location => @summary_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @summary_report.errors, :status => :unprocessable_entity }
      end
    end
  end
end
