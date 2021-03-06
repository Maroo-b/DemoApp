class CommentsController < ApplicationController
  before_action :set_article
  def index
    
    @comments = @article.comments
  end
  
  def new
    @comment = @article.comments.new 
  end
  
  def create 
     @comment = @article.comments.new(com_param)
     @comment.name= current_user.name
     if @comment.save
     respond_to do |format|
          format.html { redirect_to @article, success: 'merci pour votre commentaire' }
          format.js
          end
     end 
  end
  
  private
  def com_param
    params.require(:comment).permit(:name,:content)
  end
  def set_article
    @article =Article.find_by_id(params[:article_id])
  end
end
