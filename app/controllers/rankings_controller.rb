class RankingsController < ApplicationController
  def post
    @ranking_counts = Comment.ranking
    @posts = Post.find(@ranking_counts.keys)
    
  end
end
