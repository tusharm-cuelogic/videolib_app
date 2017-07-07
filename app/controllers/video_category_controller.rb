class VideoCategoryController < ApplicationController

	def new
		@category = Category.new
		@error = @category
	end

  	def index
		@category = Category.order(:id).page(params[:page]).per(5)
		authorize! :index, @category
		respond_to do |format|
			
			# format.js
			format.json { render json: @category }
			format.html
		end
	end

	def create
		@category = Category.new(category_params) 
		@error = @category
		authorize! :create, @category
		
		if @category.save
			flash[:success] = "Categorry Added successfully"
			redirect_to category_path
		else
			render 'new' 
		end
	end

	def edit
		@category = Category.find(params[:id])
		@error = @category 
		authorize! :edit, @category
	end

	def update
		@category = Category.find(params[:id])
		@error = @category
		authorize! :update, @category
		
		if @category.update_attributes(category_params)
			flash[:success] = "Category Info updated"
			
			if current_user.user_type == 'admin'
				redirect_to category_path
			else
				redirect_to @category
			end
		else
			render 'edit' 
		end
	end

	def destroy
		Category.find(params[:id]).destroy
		flash[:success] = "Category destroyed."
		redirect_to category_path
	end

	private

	def category_params
	  params.require(:category).permit(:name, :code, :description)
	end

end
