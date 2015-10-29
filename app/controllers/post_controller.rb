class PostController < ApplicationController
	def index
		@posts =current_user.posts.all
	end

	def new 
		if user_signed_in?
			@post=current_user.posts.new
		else
			redirect_to (root_path)
		end
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
      			flash[:post_id] = @post.id
      			redirect_to (root_path)
    		else
      			render :action => "new"
      			redirect_to (root_path)
   		end
	end

	def edit
		@post = current_user.posts.find(params[:id])
		@post.update_attribute(:content,prams[:content])
	end

	def delete
		@post = current_user.posts.find(params[:id])
		@post.delete 
	end
  	private
  	def post_params
  		params.require(:post).permit(:content)
  	end
end
