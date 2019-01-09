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

  #NEW ROUTE - RENDER THE FORM
  get '/books/new' do
    if logged_in?
      erb :'books/create'
    else
      redirect to '/login'
    end
  end

  #SHOW ROUTE - SHOW ONE BOOK
  #Put dynamic routes beneath static ones ( GET /books/new goes above)
  get '/books/:id' do
    #Dynamic route
    if logged_in?
    #Find particular book
      @book = Book.find(params[:id])
      erb :"books/show"
    else
      redirect '/login'
    end
  end

end