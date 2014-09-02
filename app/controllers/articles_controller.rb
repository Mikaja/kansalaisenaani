class ArticlesController < ApplicationController
before_action :signed_in_citizen, except: [:index, :show, :search]
before_action :admin_user, only: [:new, :edit, :destroy, :create]

def index 

	 @articles = Article.paginate(page: params[:page],:per_page   => 5)
         
end

def new
  @article = Article.new
end


def create 
        params = article_params
        
	@article = Article.new(params) 
        @article.election = Election.new(total_votes: 0, in_favor: 0, against: 0, vote: "")
	if @article.save 
		redirect_to @article 
	else 
		render 'new' 
	end

end
def show 
	@article = Article.find(params[:id])
        @comments = @article.comments.paginate(page: params[:page],:per_page   => 5)
end

def edit 
	@article = Article.find(params[:id]) 
end

def update 
	@article = Article.find(params[:id]) 
	if @article.update(article_params) 
		redirect_to @article 
	else 
		render 'edit' 
	end 
end
def destroy 
	@article = Article.find(params[:id]) 
	@article.destroy 
	redirect_to articles_path 
end

def search
     
       
     case params[:proposal]
         when "KAIKKI"
            @articles = Article.paginate(page: params[:page],:per_page   => 5)
         when "HE"
            @articles = Article.where("title LIKE ?", "HE%").paginate(page: params[:page],:per_page   => 5)
         when "LA"
            @articles = Article.where("title LIKE ?", "LA%").paginate(page: params[:page],:per_page   => 5)  
         when "VK"
            @articles = Article.where("title LIKE ?", "VK%").paginate(page: params[:page],:per_page   => 5)
         when "MUUT"
            @articles = Article.where("title LIKE ?", "MUUT%").paginate(page: params[:page],:per_page   => 5)
         else
            
            @articles = Article..paginate(page: params[:page],:per_page   => 5)
     end



 
end

private 
def article_params 
	params.require(:article).permit(:url, :title, :text) 
end

end
def signed_in_citizen
        unless signed_in?

        store_location
        redirect_to signin_url, notice: "Ole hyvä ja kirjaudu sisään."
        end
      
    end

def admin_user
      unless current_citizen && current_citizen.admin?
      store_location
      redirect_to root_url, notice: "Sinulla pitää olla ylläpito-oikeudet."
      end
end