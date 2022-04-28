class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)

        if @user.save!
            render "api/users/show"
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def index 
        @users = User.all
        render json: @users
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :phone_number)
    end
end
    # def show
    #     @user = User.find(params[:id])
    #     if @user
    #         render :show
    #     else
    #         render json: @user.errors.full_messages, status: 404
    #     end
    # end

    # def update
    #     @user = User.find(params[:id])

    #     if @user.update(user_params)
    #         render "api/users/show"
    #     else
    #         render json: @user.errors.full_messages, status: 404
    #     end
    # end

    # def destroy
    # end

