class BooksController < ApplicationController

	http_basic_authenticate_with :name => "rob", :password => "p@ssw0rd1", :except => [:index]

	layout "application"

	def index
		@books = Book.all
		##render "index", :layout => false
		render "index"
	end

	def new
		@time_now = "time zero BC"
		## render "new", :layout => false
	end

	def create
		#render plain: params[:book].inspect
		@book = Book.new(params[:book])
  		@book.save
  		redirect_to action: 'index'
	end

	private
  	def book_params
    	params.require(:book).permit(:title, :author, :price)
  	end
end
