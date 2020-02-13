class User < ApplicationRecord
  validates :name, presence: true
  
  validates :email, presence:   true
  validates :email, uniqueness: true
  validates :email, format:     { with: /\A.+@.+\..+\z/}
  
  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])[a-zA-Z\d]*\z/ }
  validates :password, format: { with: /\A(?=.*?[\d])[a-zA-Z\d]*\z/ }
  
  has_secure_password
  mount_uploader :image_name, ImageUploader
end
