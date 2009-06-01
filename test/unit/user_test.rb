require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase

  def test_required
    assert_required_values(User, :login => 'estenome', :password => 'estenome', :email => 'estenome@domain.com')
  end

  def test_length
    assert_valid_sizes User, {:login => "a", :password => "a"}, {:login => "a" * 900,
        :password => "a" * 900}, {:login => "a" * 45, :password => "a" * 45}
  end

  def test_email_format
    u = User.new(:login => "asdas", :password => "asdas", :email => "test", :name => "Fabricio")
    assert !u.valid?, "O modelo User não era para ser válido agora, mas validou"
    assert u.errors[:email]
    u.email = "test@domain"
    assert !u.valid?, "O modelo User usa um formato de email inválido" 
    assert u.errors[:email]
    u.email = "test@domain.com"
    assert u.valid?, "O modelo User era para ser válido agora"
    assert !u.errors[:email]
  end

  def test_uniqueness
    assert_unique_values User, {:login => "user1", :email => "user1@domain1.com"}, {:login => "2user1",
        :email => "2user1@domain1.com"}, {:name, :email}
  end
end
