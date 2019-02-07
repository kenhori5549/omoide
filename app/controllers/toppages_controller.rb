class ToppagesController < ApplicationController
   def index
    if logged_in?
      @post = current_user.posts.build  # form_for 用
      @posts = Post.order('created_at DESC').page(params[:page]).per(20)
    end
   end
end
