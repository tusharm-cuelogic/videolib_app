class SubscriptionsController < ApplicationController
  
  	def new
  		@subscription = Subscription.new
		@error = @subscription
  	end

  	def create

		@subscription = Subscription.new(subscription_params)
		# @video =  

		@error = @subscription
		
		if @subscription.save
			flash[:success] = "Subscription plan added successfully"
			redirect_to subscriptions_path
		else
			render 'new' 
		end
	end

	def index
		@subscription = Subscription.order(:id).page(params[:page]).per(5)
		@user = User.find(current_user)
		respond_to do |format|
			
			# format.js
			format.json { render json: @video }
			format.html
		end
	end

	def edit
		@subscription = Subscription.find(params[:id])
		@error = @subscription 
	end

	def update
		@subscription = Subscription.find(params[:id])
		@error = @subscription
		
		if @subscription.update_attributes(subscription_params)
			flash[:success] = "Subscription Info updated"
			redirect_to subscriptions_path
		else
			render 'edit' 
		end
	end

	def destroy
		Subscription.find(params[:id]).destroy
		flash[:success] = "Subscription destroyed."
		redirect_to subscriptions_path
	end

	def subscribe
		@user = User.find(current_user)
		@user.subscription_id = params[:id]
		@user.subscription_date = Time.now
		if @user.save
			flash[:success] = "Subscribed successfully"
		end
		redirect_to subscriptions_path
	end

	private

		def subscription_params
		  params.require(:subscription).permit(:plan_code, :no_of_videos, :expiry_in_days, :cost, :is_active)
		end

end
