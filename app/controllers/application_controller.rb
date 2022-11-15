
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

  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy_all
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

  get "/movies/:id" do
    movie = Movie.find(params[:id])
    movie.to_json(include: {reviews: {include: :user}})
  end

  delete "/movies/:id" do
    movie = Movie.find(params[:id])
    movie.destroy_all
    movie.to_json
  end

  post "/movies" do
    movie = Movie.create(
      title: params[:title],
      description: params[:description],
      img_url: params[:img_url]
    )
    movie.to_json
  end

  patch "/movies/:id" do
    movie = Movie.find(params[:id]).update(
      title: params[:title],
      description: params[:description],
      img_url: params[:img_url]
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
    review.destroy_all
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
  
end
