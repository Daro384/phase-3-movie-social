
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #user crud methods
  get "/users" do
    User.all.to_json(include: {reviews: {include: :movie}})
  end
  
  get "/users/:username" do
    user = User.find_by(username: params[:username])
    user.to_json(include: {reviews: {include: :movie}})
  end

  get "/user_movies/:username" do
    user = User.find_by(username: params[:username])
    user.movies.to_json
  end

  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  post "/users" do
    user = User.create(
      username: params[:username]
    )
    user.to_json
  end

  patch "/users/:username" do
    user = User.find_by(username: params[:username]).update(
      username: params[:username]
    )
    user.to_json
  end

  #movie get methods
  get "/movies" do
    Movie.all.to_json(include: {reviews: {include: :user}})
  end

  get "/movies/:title" do
    movie = Movie.find_by(title: params[:title])
    movie.to_json(include: {reviews: {include: :user}})
  end

  delete "/movies/:movieId" do
    movie = Movie.find_by(movieId: params[:movieId])
    movie.destroy
    movie.to_json
  end

  post "/movies" do
    movie = Movie.create(
      title: params[:title],
      year: params[:year],
      poster: params[:poster]
    )
    movie.to_json
  end

  patch "/movies/:id" do
    movie = Movie.find(params[:id]).update(
      title: params[:title],
      year: params[:year],
      poster: params[:poster]
    )
    movie.to_json
  end
  #we dont need delete/post/patch methods for movies

  #review get methods
  get "/reviews" do
    Review.all.to_json()
  end

  get "/reviews/:id" do 
    review = Review.find(params[:id])
    review.to_json
  end

  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end

  post "/reviews" do
    review = Review.create(
      review: params[:review],
      rating: params[:rating],
      user_id: params[:user_id],
      movie_id: params[:movie_id]
    )
    review.to_json
  end

  patch "/reviews/:id" do
    review = Review.find(params[:id]).update(
      review: params[:review],
      rating: params[:rating],
      user_id: params[:user_id],
      movie_id: params[:movie_id]
    )
    review.to_json
  end

  #in use
  delete "/review/:username/:movieId" do
    thisMovie = Movie.find_by(movieId: params[:movieId])
    thisUser = User.find_by(username: params[:username])
    thisUser.reviews.where(movie: thisMovie)[0].destroy
    thisUser.to_json
  end

  #in use
  post "/watch" do
    if Movie.find_by(movieId: params[:movieId])
      new_review = Review.create(
        review: nil,
        rating: nil,
        user: User.find_by(username: params[:username]),
        movie: Movie.find_by(title: params[:title])
      )
    else
      new_movie = Movie.create(
        title: params[:title],
        year: params[:year],
        poster: params[:poster],
        genre: params[:genre],
        actors: params[:actors],
        director: params[:director],
        plot: params[:plot],
        rated: params[:rated],
        runtime: params[:runtime],
        writer: params[:writer],
        imdb_rating: params[:imdb_rating],
        movieId: params[:movieId]
      )
      new_review = Review.create(
        review: nil,
        rating: nil,
        user: User.find_by(username: params[:username]),
        movie: new_movie
      )
    end
    new_review.to_json
  end
  
end
