class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :resources
  has_many :comments
  has_many :votes
  belongs_to :group
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  
  validates_presence_of :email, :on=>:create
  validates_presence_of :password, :on=>:create
  validates_confirmation_of :password, :on=>:create
  validates_presence_of :userName, :on=>:create

  validates_uniqueness_of :email, :case_sensitive => false,
  			  :if => :email_changed?
  validates_uniqueness_of :userName, :case_sensitive => false
  validates_format_of :email, :with  => Devise.email_regexp,
  		      :if => :email_changed?
  validates_length_of :password, :within => Devise.password_length,
  		      :allow_blank => true


  def avatar
      email_address = self.email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      image_src = "http://www.gravatar.com/avatar/#{hash}"
  end


end
