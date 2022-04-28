class User < ApplicationRecord
  before_save :downcase_nickname

  has_secure_password

  # nickname validates
  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }

  # email validates
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
