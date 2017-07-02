class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		puts params[:session]
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id]) 
	end

	def new
		@user = User.new 
		@minimum_password_length = 6
	end

	def create
		@user = User.new(user_params) 
		if @user.save
			redirect_to users_path
		else
			render 'new' 
		end
	end

	def update

		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			# sign_in @user
			redirect_to @user
		else
			render 'edit' 
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_path
	end

	private

		def user_params
		  params.require(:user).permit(:first_name, :last_name, :email, :password, 
		  	:username, :address, :city, :country, :date_of_birth)
		end

end
