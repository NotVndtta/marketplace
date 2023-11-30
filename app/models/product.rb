class Product < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    has_many :comments, dependent: :destroy
end
