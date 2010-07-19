class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable, :rememberable, :trackable, :validatable, :facebook_connectable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :loans
  
  def before_facebook_connect(fb_session)

    fb_session.user.populate(:locale, :current_location, :username, :name, :first_name, :last_name,
                              :birthday_date, :sex, :city, :state, :country)

    self.locale             = my_fancy_locale_parser(fb_session.user.locale)
    self.time_zone          = fb_session.user.current_location.try(:city)
    self.country            = fb_session.user.current_location.try(:country)

    self.username           = fb_session.user.username

    self.profile.real_name  = fb_session.user.name
    self.profile.first_name = fb_session.user.first_name
    self.profile.last_name  = fb_session.user.last_name
    self.profile.birthdate  = fb_session.user.birthday_date.try(:to_date)
    self.profile.gender     = my_fancy_gender_parser(fb_session.user.sex)

    self.profile.city       = fb_session.user.hometown_location.try(:city)
    self.profile.zip_code   = fb_session.user.hometown_location.try(:state)
    self.profile.country    = fb_session.user.hometown_location.try(:country)

  end
end
