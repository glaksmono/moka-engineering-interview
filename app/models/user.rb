class User < ActiveRecord::Base
  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }

  
  #has_secure_password shall be removed if using devise
  #has_secure_password

  validates :first_name,  presence: true, length: { maximum: 150 }
  validates :last_name,  presence: true, length: { maximum: 150 }

  has_one :business
  belongs_to :role

  accepts_nested_attributes_for :business

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('Regular')
  end
end
