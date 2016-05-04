class User < ActiveRecord::Base
    #attr_accessor :password
    #has_secure_password
	has_many :posts, dependent: :destroy
    before_save :encrypt_password
    after_save :clear_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :first_name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :last_name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create


    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.password= BCrypt::Engine.hash_secret(password, salt)
      end
    end
    
    def clear_password
      self.password = nil
    end

    def match_password(password="")
        password == BCrypt::Engine.hash_secret(password, salt)
    end

    def self.authenticate(username_or_email="", login_password="")
      user = User.find_by_username(username_or_email)
      
      if user && user.match_password(login_password)
        return user
      else
        return false
      end
    end  

    def match_password(login_password="")
      password == BCrypt::Engine.hash_secret(login_password, salt)
    end
	
end
