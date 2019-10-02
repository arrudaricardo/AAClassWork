
# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'bcrypt'
class User < ApplicationRecord
  # includes BCrypt

  validates :session_token, presence: true
  after_initialize :ensure_session_token

  attr_accessor :password

  def self.generate_sesion_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.update!(session_token: User.generate_sesion_token)
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_sesion_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    email = User.find_by(email: email)
    email && user.is_password?(password)
  end


end
