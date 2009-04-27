class CreateDefaultUser < ActiveRecord::Migration
  def self.up
    User.create :login => "teste", :password => "teste", :name => "Test user", :email => "test@domain.com"
  end

  def self.down
    User.first(:conditions => {:login => "teste"}).destroy
  end
end
