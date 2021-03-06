class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @results = @user.results.includes(:user)

    if @results[0] == nil
      @holding = 0
      @physical = 0
      @move = 0
      @positioning = 0
      @footwork = 0
      @coordination = 0
      @data = [@holding, @move, @footwork, @coordination, @positioning, @physical]
      @class = @holding + @physical + @move + @positioning + @footwork + @coordination
    else
      @holdings = @results.order(holding: :desc).first(10)
      @sum = 0
      @count = 0
      @holdings.each do |score|
        @sum += score.holding
        @count += 1
      end
      @holding = @sum / @count

      @physicals = @results.order(physical: :desc).first(10)
      @sum = 0
      @count = 0
      @physicals.each do |score|
        @sum += score.physical
        @count += 1
      end
      @physical = @sum / @count

      @moves = @results.order(move: :desc).first(10)
      @sum = 0
      @count = 0
      @moves.each do |score|
        @sum += score.move
        @count += 1
      end
      @move = @sum / @count

      @positionings = @results.order(positioning: :desc).first(10)
      @sum = 0
      @count = 0
      @positionings.each do |score|
        @sum += score.positioning
        @count += 1
      end
      @positioning = @sum / @count

      @footworks = @results.order(footwork: :desc).first(10)
      @sum = 0
      @count = 0
      @footworks.each do |score|
        @sum += score.footwork
        @count += 1
      end
      @footwork = @sum / @count

      @coordinations = @results.order(coordination: :desc).first(3)
      @sum = 0
      @count = 0
      @coordinations.each do |score|
        @sum += score.coordination
        @count += 1
      end
      @coordination = (@sum * 1.3) / @count

      @data = [@holding, @move, @footwork, @coordination, @positioning, @physical]

      @class = @holding + @physical + @move + @positioning + @footwork + @coordination
    end
  end
end
