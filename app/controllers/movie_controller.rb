class MovieController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
      title: params[:movie][:title],
      director: params[:movie][:director],
      runtime_in_minutes: params[:movie][:runtime_in_minutes],
      description: params[:movie][:description],
      poster_image_url: params[:movie][:poster_image_url],
      release_date: params[:movie][:release_date]  
    )

    if @movie.save
      redirect_to movies_path
    else
      render :new
  end

  def index 
    @movies =  Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @post.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movies = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image_url, :release_date)
  end
end
