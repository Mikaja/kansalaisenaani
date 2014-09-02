class CitizensController < ApplicationController

before_action :signed_in_citizen, only: [:index, :edit, :update, :destroy]
before_action :correct_citizen,   only: [:edit, :update]
before_action :admin_user,     only: :destroy

def index
   @citizens = Citizen.paginate(page: params[:page],:per_page   => 5)
end


def show
    @citizen = Citizen.find(params[:id])
  end

def new
    @citizen = Citizen.new
end

def edit
   
  end

def destroy
    Citizen.find(params[:id]).destroy
    flash[:success] = "Jäsen on poistettu."
    redirect_to citizens_url
end


def create
    @citizen = Citizen.new(citizen_params)
    if @citizen.save
      sign_in @citizen
      flash[:success] = "Tervetuloa Kansalaisen ääni -palveluun!"
      if Citizen.count == 1
         @citizen.update_attribute(:admin, "true")
      end
      redirect_to @citizen
    else
      render 'new'
    end
  end

def update
    
    if @citizen.update_attributes(citizen_params)
      flash[:success] = "Profiili päivitetty."
      redirect_to @citizen
    else
      render 'edit'
    end
end

def adminadd
    Citizen.find(params[:format]).update_attribute(:admin, "true")
    redirect_to citizens_url
end

def adminremove
   Citizen.find(params[:format]).update_attribute(:admin, "false")
   redirect_to citizens_url
end

private

    def citizen_params
      params.require(:citizen).permit(:name, :email, :password,
                                   :password_confirmation)
    end
 # Before filters

def signed_in_citizen
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Ole hyvä ja kirjaudu sisään."
    end
      
end

 def correct_citizen
      @citizen = Citizen.find(params[:id])
      redirect_to(root_url) unless current_citizen?(@citizen)
    end

  def admin_user
      redirect_to(root_url) unless current_citizen.admin?
  end

end
