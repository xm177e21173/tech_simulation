class User < ApplicationRecord
  validates :name, presence: true
  
  validates :email, presence:   true
  validates :email, uniqueness: true
  validates :email, format:     { with: /\A.+@.+\..+\z/}
  
  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])[a-z\d]*\z/ }
  validates :password, format: { with: /\A(?=.*?[\d])[a-z\d]*\z/ }
  
  has_many :simulations
  
  has_secure_password
  
end
