class SessionsController < ApplicationController

    def new
    end

    def create
        # @user = User.find_by(username: params[:username])
        
        # if @user && @user.authenticate.(params[:password])
        #     session[:user_id] = @user.id 
        #     redirect_to user_path(@user)
        # else
        #     flash[:errors] = ["Please Try Again"]
        #     redirect_to login_path
        # end

        user = User.find_by(name: params[:user][:name])

        user = user.try(:authenticate, params[:user][:password])
    
        return redirect_to(controller: 'sessions', action: 'new') unless user
    
        session[:user_id] = user.id
    
        @user = user
    
        redirect_to controller: 'welcome', action: 'home'
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end



end