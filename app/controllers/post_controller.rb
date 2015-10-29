class PostController < ApplicationController
	def index
		@posts =Post.all
	end

	def show 
	end

	def new 
		@post=current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
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
		@post.update_attribute(:content,prams[:content])
	end

	def delete
		@post = Post.find(params[:id])
		@post.delete 
	end
	def show
    	@post = Post.find(params[:id])
    	redirect_to @post.post
  	end
  	private
  	def post_params
  		params.require(@post).permit(:content)
  	end
end
