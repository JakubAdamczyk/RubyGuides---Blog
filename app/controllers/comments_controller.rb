class CommentsController < ApplicationController
	before_action :set_user, only: [:create, :destroy]

	# http_basic_authenticate_with name: "admin2", password: "topsecret",
	# only: :destroy

	def create
		#@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)

		redirect_to article_path(@article)
	end

	def destroy
		#@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to article_path(@article)
	end
	
private

	def set_user
		@article = Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
