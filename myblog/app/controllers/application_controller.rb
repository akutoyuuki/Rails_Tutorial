class ApplicationController < ActionController::Base
    def post(id_name = nil)
        @post ||= Post.find(params[id_name])
    end
end
