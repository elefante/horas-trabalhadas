require 'test_helper'
require 'task_type'

class TaskTypeTest < ActiveSupport::TestCase
  def test_required
    assert_required_values(TaskType, :name => 'TaskTypesTestName')
  end

  def test_uniqueness
    assert_unique_values TaskType, {:name => 'Escrever o código de negócio', :project_id => 1},
        {:project_id => 2}, [:name]
  end

  def test_length
    assert_valid_sizes TaskType, {:name => "a"}, {:name => "a" * 55}, {:name => "a" * 30}
  end
end
