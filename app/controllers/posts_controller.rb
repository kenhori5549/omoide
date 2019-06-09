class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
   @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to current_user
    else
      @posts = current_user.posts.order('created_at DESC').page(params[:page]).per(20)
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
  end
  
  def show
     @post = Post.find(params[:id])
     @comment = current_user.comments.build #コメントform用
     @comments = @post.comments.order('created_at DESC').page(params[:page]).per(10)#コメント一覧表示用
     commentcounts(@post)
     @user =User.find(@post.user_id)
  end
  
   private

  def post_params
    params.require(:post).permit(:content,:title,:image,:comment)
  end
  
   def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
