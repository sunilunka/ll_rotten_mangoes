class MoviesController < ApplicationController

  def index 
    @movies =  Movie.all

    
    if params[:search_title] == "" && params[:search_director] == "" && params[:search_time] == "runtime_in_minutes > 0"
      @movies = Movie.all
    elsif params[:search_title] || params[:search_director] || params[:search_time]
      @movies = Movie.search(
        params[:search_title],
        params[:search_director],
        params[:search_time]
        ).order("created_at DESC")
   
    end
  end

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
      # remote_image_url: params[:movie][:remote_image_url],
      # local_image_url: params[:movie][:local_image_url],
      release_date: params[:movie][:release_date]  
    )

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image_url, :release_date)
  end

end
