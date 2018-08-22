module ApplicationHelper
    def page_title
        title = "自作ブログ"
        title = @page_title + " | " + title if @page_title
        title
    end
end
