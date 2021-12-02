class User < ApplicationRecord
  validates :email, uniqueness: true

  devise :database_authenticatable, 
    :registerable, 
    :jwt_authenticatable, 
    jwt_revocation_strategy: JwtDenylist
end
