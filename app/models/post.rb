class Post < ApplicationRecord
  belongs_to :user
   validates :content, presence: true, length: { maximum: 255 }
   validates :title, length: { maximum: 20 }
   mount_uploader :image, ImageUploader
   #validate :image_valid?
   
 has_many :comments, dependent: :destroy
 has_many :replyeds,through: :comments,source: :user
  
end
