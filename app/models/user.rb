class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :current_password

  has_one :business

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true
  validates_email_format_of :email, :message => 'format is invalid.'
  validates :password, length: { minimum: 6 }, allow_nil: true
  validate :validates_current_password

  def full_name
    (first_name || "") + " " + (last_name || "")
  end

  private
    def validates_current_password
      return if password_digest_was.nil? || !password_digest_changed?
      unless BCrypt::Password.new(password_digest_was) == current_password
        errors.add(:current_password, "is incorrect")
      end
    end
end
