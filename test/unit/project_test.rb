require 'test_helper'
require 'project'

class ProjectTest < ActiveSupport::TestCase
  def test_presence
    assert_required_values Project, :name => 'testsaved'
  end

  def test_uniqueness
    assert_unique_values Project, {:name => 'Projeto de Testes'}, {:name => 'Projeto de Testes 2'}, [:name]
  end 

  def test_length
   assert_valid_sizes Project, {:name => "a"}, {:name => "a" * 55}, {:name => "a" * 35} 
  end 
end 
