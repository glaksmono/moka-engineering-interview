class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  before_save :assign_role

  has_secure_password

  has_one :business
  belongs_to :role

  accepts_nested_attributes_for :business

  validates :first_name,  presence: true, length: { maximum: 150 }
  validates :last_name,  presence: true, length: { maximum: 150 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 } 

  def admin?
    self.role.name == "Admin"
  end

  def seller?
    self.role.name == "Seller"
  end

  def regular?
    self.role.name == "Regular"
  end

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
end
