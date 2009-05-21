require 'test_helper'

class SummaryReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:summary_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create summary_report" do
    assert_difference('SummaryReport.count') do
      post :create, :summary_report => { }
    end

    assert_redirected_to summary_report_path(assigns(:summary_report))
  end

  test "should show summary_report" do
    get :show, :id => summary_reports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => summary_reports(:one).to_param
    assert_response :success
  end

  test "should update summary_report" do
    put :update, :id => summary_reports(:one).to_param, :summary_report => { }
    assert_redirected_to summary_report_path(assigns(:summary_report))
  end

  test "should destroy summary_report" do
    assert_difference('SummaryReport.count', -1) do
      delete :destroy, :id => summary_reports(:one).to_param
    end

    assert_redirected_to summary_reports_path
  end
end
