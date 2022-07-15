class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    # before_action :require_user, only: [:edit, :update]
    # before_action :require_same_user, only: [:edit, :update, :destroy]
    def show
        @conferences = @user.conferences
        # .paginate(page: params[:page], per_page: 5) 
    end

    # def search
    #     if params[:search].blank?
    #         flash[:alert] = "Please enter a search first"
    #         redirect_to users_path and return
    #     else
    #         @parameter = params[:search].downcase
    #         @results = User.all.where("lower(username) LIKE :search", search: "%#{@parameter}%")
    #     end
    # end

    def index
        @users = User.all
        # @user = User.search(params[:search])
        # @users = User.paginate(page: params[:page], per_page: 5) 
    end
    def new
        @user = User.new
    end
    def edit
        
    end
    def update
        
        if @user.update(user_params)
            redirect_to @user
            flash[:notice] = "Your account information was successfully updated"
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
        #    session[:user_id] = @user.id
           flash[:notice] = "Welcome to ConferencesApp #{@user.username}, you've successfully signed up!"
           redirect_to conferences_path
        else
            render 'new'     
        end
    end

    def destroy
        @user.destroy
        flash[:notice] = "Account and all associated articles where successfully deleted"
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password_digest, :bio, :company )
    end

    def set_user
        @user = User.find(params[:id])
    end
    
    # def require_same_user
    #     if current_user != @user && !current_user.admin?
    #         flash[:alert] = "You can only edit or delete your own account"
    #         redirect_to @user
    #     end
    # end
end