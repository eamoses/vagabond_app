class User < ActiveRecord::Base
  has_many :posts
  has_secure_password

VALID_NAME_REGEX = /[a-zA-Z]/
  validates :first_name,
              presence: true,
              format:   { with: VALID_NAME_REGEX },
              length:   { maximum: 255 }

  validates :last_name,
              presence: true,
              format:   { with: VALID_NAME_REGEX },
              length:   { maximum: 255 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
              presence:   true,
              format:     { with: VALID_EMAIL_REGEX },
              uniqueness: true,
              length:     { maximum: 255 }

    def self.confirm(params)
        @user = User.find_by({email: params[:email]})
        @user.try(:authenticate, params[:password])
    end
end
