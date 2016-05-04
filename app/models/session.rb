class Session < ActiveRecord::Base
	before_create :encrypt_password
	def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.password= BCrypt::Engine.hash_secret(password, salt)
      end
    end
end
