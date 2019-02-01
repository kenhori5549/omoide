class Post < ApplicationRecord
  belongs_to :user
   validates :content, presence: true, length: { maximum: 511 }
   
   mount_uploader :image, ImageUploader
   #validate :image_valid?
   
   # def image_valid?
   # if post.file.content_type != "image/jpeg" ||"image/jpg"|| "image/jpeg"||"image/png"|| "image/x-citrix-png"|| "image/x-citrix-jpeg"|| "image/x-png"|| "image/pjpeg"
    #  errors.add(:image, "不正なファイルが添付されています。")
   # end
  #end
end
