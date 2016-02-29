class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :resources
  has_many :comments
  has_many :votes
  belongs_to :group
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
