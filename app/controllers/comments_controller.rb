class CommentsController < ApplicationController

    before_action :require_user
    before_action :user_doesnt_have_profile
    before_action :set_post_to_comment, only: [:create]

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        #@message = @comment.valid?
        if @comment.save
            redirect_to post_path(@post)#, notice: "#{@message}, Comment: #{@comment.body}, Post: #{@comment.post_id}, User: #{@comment.user_id}"
        end
    end

    def destroy
        @comment = params[:comment]
        @post = params[:post]
        Comment.look_up_comment(@comment)
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end

        def set_post_to_comment
            @post = Post.find(params[:post_id])
        end
end
