class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :business
  attr_accessor :current_password

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true
  validates_email_format_of :email, :message => 'format is invalid.'
  validates :password, length: { minimum: 6 }, allow_nil: true

  def full_name
    (first_name || "") + " " + (last_name || "")
  end
end
