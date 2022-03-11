class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @results = @user.results.includes(:user)
    @holdings = @results.order(holding: :desc).first(10)
    @physicals = @results.order(physical: :desc).first(10)
    @moves = @results.order(move: :desc).first(10)
    @positionings = @results.order(positioning: :desc).first(10)
    @footworks = @results.order(footwork: :desc).first(10)
    @coordinations = @results.order(coordination: :desc).first(5)
  end
end
