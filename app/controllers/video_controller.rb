class VideoController < ApplicationController

	def new
		@video = Video.new
		@error = @video
	end

	def create

		@video = current_user.videos.build(video_params)
		# @video = Video.new(video_params) 

		@error = @video
		
		if @video.save
			flash[:success] = "Video Added successfully"
			redirect_to video_index_path
		else
			render 'new' 
		end
	end

	def index
		if current_user.user_type == 'admin'
			@video = Video.order(:id).page(params[:page]).per(5)
		else
			@user = User.find(current_user)
			@video = @user.videos.order(:id).page(params[:page]).per(5)
		end
		respond_to do |format|
			
			# format.js
			format.json { render json: @video }
			format.html
		end
	end

	def edit
		@video = Video.find(params[:id])
		@error = @video 
	end

	def update
		@video = Video.find(params[:id])
		@error = @video
		
		if @video.update_attributes(video_params)
			flash[:success] = "Video Info updated"
			redirect_to video_index_path
		else
			render 'edit' 
		end
	end

	def destroy
		Video.find(params[:id]).destroy
		flash[:success] = "Video destroyed."
		redirect_to video_index_path
	end

	private

		def video_params
		  params.require(:video).permit(:title, :video_url, :category_id, :composer, :is_active, :user_id)
		end
end
