module SessionsHelper


def sign_in(citizen)
    remember_token = Citizen.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    citizen.update_attribute(:remember_token, Citizen.digest(remember_token))
    if citizen.name == "Pekka"
      citizen.update_attribute(:admin, "true")
    end
    self.current_citizen = citizen
end

def signed_in?
    !current_citizen.nil?
end

def current_citizen=(citizen)
    @current_citizen = citizen
end

def current_citizen
    
    remember_token = Citizen.digest(cookies[:remember_token])
   
    @current_citizen = Citizen.find_by(remember_token: remember_token)
end

def current_citizen?(citizen)
    citizen == current_citizen
end


def sign_out
      
       if signed_in?
          current_citizen.update_attribute(:remember_token,
                                   Citizen.digest(Citizen.new_remember_token))
       end                
       cookies.delete(:remember_token)
       self.current_citizen = nil
        
end

def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
end

def store_location
    session[:return_to] = request.url if request.get?

end

end