class UsersController < ApplicationController

	load_and_authorize_resource
	
	# before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :create, :show]
	# before_filter :admin_user, only: [:index, :destroy, :create, :new]
	# before_filter :correct_user, only: [:edit, :update]

	def new
		@user = User.new 
		@error = @user
		@minimum_password_length = 6
	end

	def index
		# @users = User.all
		@users = User.order(:id).page(params[:page]).per(5)
		respond_to do |format|
			
			# format.js
			format.json { render json: @users }
			format.html
		end
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			
			# format.js
			format.json { render json: @user }
			format.html
		end
	end

	def edit
		@user = User.find(params[:id])
		@error = @user 
	end

	def create
		@user = User.new(user_params)
		@error = @user 
		if @user.save
			flash[:success] = "User Added successfully"
			redirect_to users_path
		else
			render 'new' 
		end
	end

	def update

		@user = User.find(params[:id])
		@error = @user
		
		if @user.update_attributes(user_params)
			flash[:success] = "User Info updated"
			# sign_in @user
			if current_user.user_type == 'admin'
				redirect_to users_path
			else
				redirect_to @user
			end
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
		  	:username, :address, :city, :country, :date_of_birth, :user_type)
		end

		# def signed_in_user
		# 	unless !current_user.nil?
		# 		redirect_to new_user_session_path, notice: "Please sign in." 
		# 	end
		# end

		# def admin_user
		# 	redirect_to(root_path) unless current_user.user_type == 'admin'
		# end

		# def correct_user
		# 	if current_user.user_type != 'admin'
		# 		@user = User.find(params[:id])
		# 		redirect_to(root_path) unless current_user.id == @user.id
		# 	end
		# end
end
