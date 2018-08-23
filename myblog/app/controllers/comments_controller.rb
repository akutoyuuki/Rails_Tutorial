class CommentsController < ApplicationController

    def create
        post
        @comment = @post.comments.new(comment_params)
        if @comment.save
            redirect_to post_path(@post)
            flash[:success] = "コメントを1件作成しました"
        else
            redirect_to post_path(@post)
            flash[:error] = "コメントの作成に失敗しました"
        end
    end

    def show
        comment
        render 'edit'
    end

    def edit
        comment
    end

    def update
        comment
        if @comment.update(comment_params)
            redirect_to post_path(@post)
            flash[:success] = "コメントを1件更新しました"
        else
            render 'edit'
            flash.now[:error] = "コメントの更新に失敗しました"
        end
    end

    def destroy
        comment
        if @comment.destroy
            redirect_to post_path(@post)
            flash[:success] = "コメントを1件削除しました"
        else
            redirect_to post_path(@post)
            flash[:error] = "コメントの削除に失敗しました"
        end
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
