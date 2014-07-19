require 'bcrypt'

module DealRedemptions
  class User < ActiveRecord::Base
    before_save :encrypt_password
    before_save :log_last_login

    attr_accessor :password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 6 }, presence: true, confirmation: true, on: :create

    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    def log_last_login
      self.last_login = Time.now
    end
  end
end
