class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

 has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replys, through: :comments, source: :post, dependent: :destroy
  #postにreplyする
  def reply(post,content)
    self.comments.build(post_id: post.id,content: content).save
  end

  #postにreplyをdestroy　不要　hidden_field タグでcomment.idを取得して、destroyすることでコメントを削除する。
  # def unreply(post)
  #  comment = self.comments.find_by(post_id: post.id)
  #  comment.destroy if comment
  # end

  #userはこのpostにreplyしている？
  def reply_post?(post)
    self.replys.include?(post)
  end

end