class CommentsController < ApplicationController

    def comment
        post(:post_id)
        @comment ||= @post.comments.find(params[:id])
    end

    def create
        post(:post_id)
        if @post.comments.create(comment_params)
            redirect_to post_path(@post)
        else
            render 'posts/show'
        end
    end

    def edit
        comment
    end

    def update
        comment
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        comment
        if @comment.destroy
            redirect_to post_path(@post)
        else
            render 'posts/show'
        end
    end


    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
