class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :facebook_connectable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :loans
  
  def before_facebook_connect(fb_session)
    
    fb_session.user.populate(:first_name, :last_name)

    self.username           = fb_session.user.first_name + " " + fb_session.user.last_name
  end
  
  def screen_name
    return username unless username.blank?
    email
  end
end
