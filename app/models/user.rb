class User < ActiveRecord::Base
  has_many :authentications  
  has_many :posts
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :validatable,
          :database_authenticatable , :registerable, :recoverable
  belongs_to :artist
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :artist_id, :role_ids, :real_name, :avatar, :username, :email, :password, :password_confirmation, :remember_me
  mount_uploader :avatar, ImageUploader
  

  
  def apply_omniauth(omniauth)
    if omniauth['provider'] == 'twitter'
      logger.warn(omniauth['info'].inspect)
      self.username = omniauth['info']['nickname']
      self.real_name = omniauth['info']['name']
      self.real_name.strip!

    elsif omniauth['provider'] == 'facebook'
      self.email = omniauth['info']['email'] if email.blank?
      self.username = omniauth['info']['nickname']
      self.real_name = omniauth['info']['first_name'] + ' ' + omniauth['info']['last_name']
      self.real_name.strip!
      # self.location = omniauth['extra']['user_hash']['location']['name'] if location.blank?
    end
    self.email = omniauth['info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def icon(size = :standard)
    if avatar?
      avatar.url(size)
    else
      'missing_person.png'
    end
  end
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end
