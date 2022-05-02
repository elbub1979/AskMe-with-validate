class User < ApplicationRecord
  before_save :downcase_nickname

  has_secure_password

  # nickname validates
  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }

  # email validates
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # navbar_color validates
  validates :navbar_color, presence: true, format: { with: /\A#[a-f0-9]{6}\z/i }

  def downcase_nickname
    nickname.downcase!
  end
end
