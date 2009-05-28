require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase

  def test_required
    assert_required_values(User, :login => 'estenome', :password => 'estenome', :email => 'estenome@domain.com')
  end

  def test_length
    assert_valid_sizes User, {:login => "a", :password => "a"}, {:login => "a" * 90,
        :password => "a" * 90}, {:login => "a" * 45, :password => "a" * 45}
  end

  def test_email_format
    u = User.new(:login => "asdas", :password => "asdas", :email => "test", :name => "Fabricio")
    assert !u.save
    assert u.errors[:email]
    u.email = "test@domain"
    assert !u.save
    assert u.errors[:email]
    u.email = "test@domain.com"
    assert u.save
    assert !u.errors[:email]
  end

  def test_uniqueness
    assert_unique_values User, {:login => "user1", :password => "user1", :email => "user1@domain1.com"},
        {:login => "fernando", :password => "macaco", :email => "fernando@domain.com"}, {:name, :password, :email}
  end
end
