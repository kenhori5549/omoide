class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
   validates :content, presence: true, length: { maximum: 255 }
   
    def self.ranking
        self.group(:post_id).order('count_post_id DESC').limit(10).count(:post_id)
    end
end
