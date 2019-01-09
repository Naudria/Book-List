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

   #CREATE ACTION - Use incoming form info to create new book
  post '/books' do
    if logged_in? 
      @book = current_user.books.create(title: params[:title], author: params[:author], genre: params[:genre], user_id: params[:user_id])
      redirect "/books"
      flash[:message] = "Book has been added."
    else
      erb '/books/create'
      flash[:message] = "When creating a new book, please provide both a title and an author."
    end
  end

  
  get '/books/:id/edit' do
    if logged_in?
       @book = Book.find(params[:id])
      if current_user.id == @book.user_id
      erb :"books/edit"
    else
      flash[:message] = "You are not authorized to edit this Book."
      redirect to '/login'
     end
    end
  end

  patch '/books/:id' do
    if logged_in?
        @book = Book.find(params[:id])
        
        @book.update(title: params[:title], author: params[:author], genre: params[:genre])
        flash[:message] = "Your Book Has Been Succesfully Updated"
        redirect to '/books'
      else
        redirect to "/books/#{@book.id}/edit"
      
    end
  end

end