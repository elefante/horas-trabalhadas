require 'test_helper'
require 'summary_report'
require 'task_type'

class SummaryReportTest < ActiveSupport::TestCase
  def test_generate_report_no_params
    rep = SummaryReport.new
    data = rep.report_data
    assert_equal 2, data.length
  end

  def test_generate_report_project_filter
    rep = SummaryReport.new
    rep.project = projects(:one)
    data = rep.report_data
    assert_equal 2, data.length
  end

  def test_generate_report_task_type_filter
    rep = SummaryReport.new
    rep.task_type = TaskType.find 1
    data = rep.report_data
    assert_equal 1, data.length
  end  
end
