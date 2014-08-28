class CommentsController < ApplicationController
before_action :admin_user, only: [:destroy]

def create 
	@article = Article.find(params[:article_id]) 
	@comment = @article.comments.create(comment_params) 
	redirect_to article_path(@article) 
end 

def destroy 
	@article = Article.find(params[:article_id]) 
	@comment = @article.comments.find(params[:id]) 
	@comment.destroy 
	redirect_to article_path(@article) 
end


private 
def comment_params 
	params.require(:comment).permit(:commenter, :body) 
end

end
def admin_user
      unless  current_citizen && current_citizen.admin?
      store_location
      redirect_to root_url, notice: "Sinulla pitää olla ylläpito-oikeudet."
      end
end