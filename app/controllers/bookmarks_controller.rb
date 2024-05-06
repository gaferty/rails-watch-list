class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]
  # def index
  #   @bookmarks = Bookmark.all
  # end

  # def show

  # end

  def new

    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movies = Movie.all
    if @bookmark.save
      raise
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit

  # end


  # def update
  #   if @bookmark.update(bookmark_params)
  #     redirect_to lists_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list) , status: :see_other
  end


  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
     params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
