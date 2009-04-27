require 'test_helper'

class TaskTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_type" do
    assert_difference('TaskType.count') do
      post :create, :task_type => { }
    end

    assert_redirected_to task_type_path(assigns(:task_type))
  end

  test "should show task_type" do
    get :show, :id => task_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => task_types(:one).to_param
    assert_response :success
  end

  test "should update task_type" do
    put :update, :id => task_types(:one).to_param, :task_type => { }
    assert_redirected_to task_type_path(assigns(:task_type))
  end

  test "should destroy task_type" do
    assert_difference('TaskType.count', -1) do
      delete :destroy, :id => task_types(:one).to_param
    end

    assert_redirected_to task_types_path
  end
end
