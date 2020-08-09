class SearchController < ApplicationController

def search
	type = params[:search_type]
    method = params[:search_method]
    word = params[:search_word]
    if type == "user_match"
    	@users = User.search(type,method,word)
    	render template: "search/user_search"
	elsif type == "book_match"
    	@books = Book.search(type,method,word)
    	render template: "search/book_search"
	end
end


end
