class User < ApplicationRecord
  # acts_as_token_authenticatable
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(authentication_token: token)
    token
  end
end
