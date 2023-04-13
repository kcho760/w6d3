class UsersController < ApplicationController

    def index
        # render plain: "I'm in the index action!" 
        # @users = User.all
        render json: User.all
    end 

    def create
        # debugger
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save!
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        debugger
        if @user.update(params.require(:user).permit(:name, :email))
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to user_url
    end

    # def user_params
    #     params.require(:user).permit(:name, :email)
    # end
end