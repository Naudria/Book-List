class BooksController < ApplicationController

  #INDEX ROUTE - SHOW ALL THE BOOKS
  get '/books' do
    if logged_in?
      #Instance variable that passes to index view
      @books = Book.all
      erb :'books/index'
      #With GET requests, we often render erb, not redirect
    else
      redirect to '/signup'
   end
  end

end