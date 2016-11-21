class LongestWordController < ApplicationController
  def game
    @grid = generate_grid(9)
    @word = params[:kutkak]
    @start_time = Time.now
  end

  def score
    @word = params[:kutkak]
    @start_time = Time.parse(params[:start])
    @end_time = Time.now
    @total_time = @end_time - @start_time
    @score = compute_score(@word, @total_time)
    @score_message = score_and_message(@word, @grid, @total_time)
  end
end

require 'open-uri'
require 'json'

def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a[rand(26)] }
end


def included?(guess, grid)
  guess.all? { |letter| guess.count(letter) <= grid.count(letter) }
end

def compute_score(attempt, time_taken)
  (time_taken > 60.0) ? 0 : attempt.size * (1.0 - time_taken / 60.0)
end

def score_and_message(attempt, grid, time)
  if @word
    return "Well done"
  else
    return "You suck"
end
end
