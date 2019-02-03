class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
   private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
   def postcounts(user)
    @count_posts = user.posts.count
   end
  
   def commentcounts(post)
    @count_comments = post.comments.count
   end
end
