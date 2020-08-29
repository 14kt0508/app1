class BooksController < ApplicationController

	def top
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		 @book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def destroy
		book = Book.find(params[:id]) #データ(レコード)を1件取得
    	book.destroy #データ（レコード）を削除
    	redirect_to books_path #List一覧画面へリダイレクト
	end

	def create
		@book = Book.new(book_params)
		@books = Book.all #31行目に持たせている。
		if @book.save
			redirect_to book_path(@book.id), notice: 'successfully'
		else
			render :index #view直接呼び出す
		end

    end

    def update
		@book = Book.find(params[:id])
    	if @book.update(book_params)
			redirect_to book_path(@book.id), notice: 'successfully'
		else
			render :edit #view直接呼び出す
		end
	end

    private
  		# ストロングパラメータ
  	def book_params
    	params.require(:book).permit(:title, :body)
  	end





end
