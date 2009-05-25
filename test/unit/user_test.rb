require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase

  def test_required
    u = User.new
    u.save
    assert u.errors[:name]
    assert u.errors[:login]
    assert u.errors[:password]
    assert u.errors[:email]
  end

  def test_length
    # login e passwords muito pequenos
    u = User.new(:login => "a", :password => "a", :email => "test@mail.com", :name => "Emanuel")
    assert !u.save
    assert u.errors[:login]
    assert u.errors[:password]

    # login e passwords muito grandes
    u.login = "a" * 101
    u.password = "a" * 55
    assert !u.save
    assert u.errors[:login]
    assert u.errors[:password]

    # login e passwords tamanho OK
    u.login = "a" * 90
    u.password = "a" * 45
    assert u.save
    assert !u.errors[:login]
    assert !u.errors[:password]
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
    u = User.new(:login => "user1", :password => "asdas", :email => "user1@domain1.com", :name => "qualquer nome")
    assert !u.save
    assert u.errors[:login]
    assert u.errors[:email]
    u.login = "2user1"
    u.email = "2user1@domain1.com"
    assert u.save
    assert !u.errors[:login]
    assert !u.errors[:email]
  end
end
