class ElectionController < ApplicationController

before_action :signed_in_citizen, only: [:create, :update, :edit]
def create 
	@article = Article.find(params[:article_id]) 
	@election = @article.election.create(total_votes: 0, in_favor: 0, against: 0, vote:"") 
	redirect_to article_path(@article) 
end 
def edit
end
def update
	@article = Article.find(params[:article_id])
        election = @article.election
	e_params = election_params
        @citizen = current_citizen
        success = false
        if e_params[:vote] == "JAA" || e_params[:vote] == "EI"
		e_params[:total_votes] = election.total_votes + 1
		if e_params[:vote] == "JAA"
			e_params[:in_favor] = election.in_favor + 1
		else
			e_params[:against] = election.against + 1
		end
                success = @citizen.votes.create(proposal_id: params[:article_id])
        end  
		

	if success && @article.election.update(e_params) 
                flash[:success] = "Äänesi on rekisteröity!"
		redirect_to articles_path(@article)
        end		
	
end

def destroy 
	@article = Article.find(params[:article_id]) 
	@election = @article.election 
	@election.destroy 
	redirect_to article_path(@article) 
end


private 
def election_params 
	params.require(:election).permit(:total_votes, :in_favor, :against, :vote) 
end

def vote_given?
     citizen = current_citizen
     citizen.votes.find_by(proposal_id: params[:article_id])
   
end

def signed_in_citizen
        if signed_in?
          if vote_given?
            redirect_to article_url, notice: "Olet jo äänestänyt."
          end 
        else
          store_location
          redirect_to signin_url, notice: "Voidaksesi äänestää sinun tulee ensin kirjautua palveluun."
        end
      
    end
end












