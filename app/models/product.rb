class Product < ApplicationRecord

  mount_uploader :image, ProductUploader

  validates :name, :description, :image, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 3 }
  validates :description, length: { minimum: 10 }

end
