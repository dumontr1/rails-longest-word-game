class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << (('A'..'Z').to_a.sample)
    end
  end

  def score
    @word = params[:answer].upcase.split('')
    @letters = params[:letters].split(' ')
    @result = nil
    @word.each do |letter|
      if @letters.include?(letter)
        @result = true
        @letters.delete_at(@letters.index(letter))
      else
        @result = false
      end
      break if @result == false
    end
  end
end
