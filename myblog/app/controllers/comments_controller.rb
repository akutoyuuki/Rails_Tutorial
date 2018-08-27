class CommentsController < ApplicationController

    def create
        @comment = post.comments.new(comment_params)
        if comment.save
            flash[:success] = "コメントを1件作成しました"
        else
            flash[:error] = "コメントの作成に失敗しました"
        end
        redirect_to post_path(post)
    end

    def show
        comment
        render :edit
    end

    def edit
        comment
    end

    def update
        if comment.update(comment_params)
            redirect_to post_path(post)
            flash[:success] = "コメントを1件更新しました"
        else
            render :edit
            flash.now[:error] = "コメントの更新に失敗しました"
        end
    end

    def destroy
        if comment.destroy
            flash[:success] = "コメントを1件削除しました"
        else
            flash[:error] = "コメントの削除に失敗しました"
        end
        redirect_to post_path(post)
    end


    private
        def comment_params
            params.require(:comment).permit(:body)
        end

        def post
            @post ||= Post.find(params[:post_id])
        end
    
        def comment
            @comment ||= post.comments.find(params[:id])
        end
end
