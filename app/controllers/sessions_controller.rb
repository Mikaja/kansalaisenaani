class SessionsController < ApplicationController


  def new
   render 'new'

  end

  def create
    
       citizen = Citizen.find_by(email: params[:session][:email].downcase)
       if citizen && citizen.authenticate(params[:session][:password])     
          sign_in citizen
         if citizen == Citizen.find_by(remember_token: Citizen.digest(cookies[:remember_token]))
          redirect_back_or citizen
         else
           flash.now[:error] = 'Not found by token'
           render 'new'
         end 
       else
          flash.now[:error] = 'Invalid email/password combination'
         render 'new'
       end
    


   


  end

  def destroy
  
     sign_out

     redirect_to root_url


  
     
     

  end


end
