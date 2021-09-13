class BooksController < ApplicationController
	def index
	end
	def new
		@book = Book.new()
	end
	def create
        @book = Book.new(book_params)
        
        if @book.save
            redirect_to @book
        end
    end
    def update
		@book = Book.find(params[:id])
        if @book.update(book_params)
        end
	end
    
	def show
		@book= Book.find(params[:id])
		@authors = []
		@authors1 = [["",""]]
		unless @book.authors.length == 0
			@book.authors.reorder("lastname ASC").each do |a|
				@authors << a
			end
		end
		Author.all.reorder("lastname ASC").each do |a|
			@authors1 << [a.name,a.id.to_s]
		end
	end
	def existingauthor
		@book = Book.find(params[:id])
		if params[:existingauthor][:id].to_s != ""
			@book.authors << Author.where(:id =>params[:existingauthor][:id]).first
		end
	end
    
	def newauthor
		@book = Book.find(params[:id])
		if params[:newauthor][:first].to_s != ""
			author = Author.new()
			author.firstname = params[:newauthor][:first].to_s
			if params[:newauthor][:first].to_s != ""
				author.lastname = params[:newauthor][:last].to_s
			end
			@book.authors << author
			author.save
		end
	end

  def search
		@books = Book.all
		query = ""
		if params[:searchtopic] == "dewey"
			@books = Book.where("cat_ddc LIKE :prefix", prefix: "#{params[:searchvalue]}%").reorder("title ASC")
		end
	end

	def book_params
		params.require(:book).permit!
	end
end