class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    
    post = Post.find(params[:post_id])
    if current_user.reply(post,params.require(:comment).permit(:content)[:content])
    flash[:success] = 'コメントしました。'
    redirect_to post
    
    else
    flash[:info] = 'コメントに失敗しました。'
     redirect_to post
    end
  end  

  def destroy
    #comment = Comment.find_by(params[:id])
    @comment.destroy
    flash[:success] = 'あなたのコメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
    def correct_user
    @comment = Comment.find_by(id: params[:id])
      unless @comment
        redirect_to root_url
      end
    end
end
