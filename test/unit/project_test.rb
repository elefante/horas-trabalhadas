require 'test_helper'
require 'project'

class ProjectTest < ActiveSupport::TestCase
  def test_presence
    p = Project.new
    assert !p.valid?
    assert p.errors.invalid?(:name)
    p.name = 'testsaved'
    assert p.valid?
    assert !p.errors.invalid?(:name)
  end

  def test_uniqueness
    p = Project.new(:name => 'Projeto de Testes')
    assert !p.valid?
    assert p.errors.invalid?(:name)
    p.name = 'Projeto de Testes2'
    assert p.valid?
    assert !p.errors.invalid?(:name)
  end

  def test_length
    p= Project.new(:name => 'a')
    assert !p.valid?
    assert p.errors.invalid?(:name)
    p.name = 'a' * 55
    assert !p.valid?
    assert p.errors.invalid?(:name)
    p.name = 'a' * 45
    assert p.valid?
    assert !p.errors.invalid?(:name)
  end 
end 
