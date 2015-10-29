class PostController < ApplicationController
	def Myposts
		@posts =current_user.posts.all
	end
	def Allposts
		@posts=Post.all
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
		@post = Post.find(params[:id])
		@post.update_attributes(:content=>params[:content])
	end

	def delete
		@post = Post.find(params[:id])
		@post.delete 
	end
  	private
  	def post_params
  		params.require(:post).permit(:content)
  	end
end
