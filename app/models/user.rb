class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :sports_type, presence: true
    validates :age,length: { maximum: 2}, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
    validates :place, presence: true
    validates :profile, presence: true
    has_secure_password
    
end
