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
        render json: "I'm in the show action!" 
    end

    # def user_params
    #     params.require(:user).permit(:name)
    # end
end