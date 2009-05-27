require 'test_helper'
require 'task_type'

class TaskTypeTest < ActiveSupport::TestCase
  def test_required
    assert_required_values(TaskType, :name => 'TaskTypesTestName')
  end

  def test_uniqueness
    assert_unique_values(TaskType, {:name => 'Escrita do código de negócio',
        :project_id => 1}, {:project_id => 2}, [:name])
  end

  def test_length
    assert_valid_sizes TaskType, {:name => "a"}, {:name => "a" * 55}, {:name => "a" * 30}
  end

  def assert_valid_sizes(model_class, small_values, big_values, ok_values)
    obj = model_class.new
    small_values.each do |name, value|
      obj.[]=(name, value)
    end
    assert !obj.valid?, "O modelo #{model_class.name} não devia estar válido agora,
        pois foi preenchido com valores muito pequenos"
    small_values.each do |name, value|
      assert obj.errors.invalid?(name), "O atributo #{name} do modelo #{model_class}
          não deveria ser válido agora, pois foi preenchido com um valor muito pequeno"
    end
    big_values.each do |name, value|
      obj.[]=(name, value)
    end
    assert !obj.valid?, "O modelo #{model_class.name} não devia estar válido agora,
        pois foi preenchido com valores muito grandes"
    big_values.each do |name, value|
      assert obj.errors.invalid?(name), "O aributo #{name} do modelo #{model_class}
          não deveria ser válido agora, pois foi preenchido com um valor muito grande"
    end
    ok_values.each do |name, value|
      obj.[]=(name, value)
    end
    obj.valid?
    ok_values.each do |name, value|
      assert !obj.errors.invalid?(name), "O atributo #{name} do modelo
          #{model_class} não deveria conter erros, o valor informado é válido"
    end
  end

  def assert_unique_values(model_class, invalid_values, valid_values, fields_to_validate)
    obj = model_class.new
    invalid_values.each do |name, value|
      obj.[]=(name, value)
    end
    assert !obj.valid?, "O modelo #{model_class.name} deveria estar inválido agora"
    fields_to_validate.each do |name|
      assert obj.errors.invalid?(name), "O atributo #{name} do modelo
          #{model_class.name} deveria validar se é único, mas não validou"
    end
    valid_values.each do |name, value|
      obj.[]=(name, value)
    end
    obj.valid?
    fields_to_validate.each do |name|
      assert !obj.errors.invalid?(name), "O atributo #{name} do modelo
          #{model_class.name} deveria passar na validação agora, mas não passou"
    end
  end

  def assert_required_values(model_class, valid_values)
    # instanciar o objeto
    obj = model_class.new
    # verificar se os erros já existem 
    assert !obj.valid?, "O modelo #{model_class.name} não passou no teste de valores requeridos"
 
    valid_values.each do |attr_name, attr_value| 
      assert obj.errors.invalid?(attr_name), "O atributo #{attr_name} do modelo
          #{model_class.name} não passou na validação de valor requerido"
    end
    # atribuir valores válidos
    valid_values.each do |attr_name, attr_value|
      obj.[]=(attr_name, attr_value)
    end
    # verificar se os erros desapareceram
    obj.valid?
    valid_values.each do |attr_name, attr_value|
      assert !obj.errors.invalid?(attr_name), " O atributo #{attr_name} do modelo
         #{model_class.name} deveria estar válido agora"
    end
  end
end
