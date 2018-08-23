class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        post
    end

    def new
        @post = Post.new
    end

    def create
        # render plain: params[:post].inspect
        # save
        # @post = Post.new(params[:post])
        # @post = Post.new(params.require(:post).permit(:title, :body))
        @post = Post.new(post_params)
        if @post.save
            # redirect
            redirect_to posts_path
            flash[:success] = "#{@post.title}を作成しました" 
        else
            # render plain: @post.errors.inspect
            render 'new'
            flash.now[:error] = "新規記事の作成に失敗しました"
        end
    end

    def edit
        post
    end
    
    def update
        post
        if @post.update(post_params)
            redirect_to posts_path
            flash[:success] = "#{@post.title}を更新しました"
        else
            render 'edit'
            flash.now[:error] = "記事の更新に失敗しました"
        end
    end

    def destroy
        post
        if @post.destroy
            redirect_to posts_path
            flash[:success] = "#{@post.title}を削除しました"
        else
            render 'index'
            flash.now[:error] = "記事の削除に失敗しました"
        end
    end


    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

        def post
            @post ||= Post.find(params[:id])
        end
end
