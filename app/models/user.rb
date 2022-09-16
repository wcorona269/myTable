# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  dname           :string           not null
#  fname           :string           not null
#  lname           :string           not null
#  email           :string           not null
#  phone           :bigint           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :dname, :email, :password_digest, :phone, :fname, :lname, presence: true
    validates :email, :phone, uniqueness: true
    validates :password, length: {minimum: 6 }, allow_nil: true
    validates :session_token, presence: true, uniqueness: true
    # validates_length_of :phone, 
    validate :valid_email  

    after_initialize :ensure_session_token
    attr_reader :password

    has_many :reviews,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Review
    
    has_many :bookings,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Booking

    has_many :favorites,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Favorite

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def is_password?(password)
        pass_obj = BCrypt::Password.new(self.password_digest)
        pass_obj.is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def generate_session_token
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = self.generate_session_token
        self.save!
        self.session_token
    end

    private
    def valid_email
        if !email.include?("@")
            errors.add(:email, "Please enter a valid email")
        end
    end
end
