class User < ActiveRecord::Base
  has_many :project_memberships, :conditions => "leaved is null"
  has_many :time_logs
  has_many :projects, :through => :project_memberships
  validates_presence_of :login, :password, :name, :email
  validates_length_of :login, :in => 5..100
  validates_length_of :password, :in => 5..50
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_uniqueness_of :login
  validates_uniqueness_of :email

  def self.logon(username_or_email, password)
    user = User.first :conditions => ["(login = ? or email = ?) and password = ?", username_or_email, username_or_email, password]
    user
  end
end
