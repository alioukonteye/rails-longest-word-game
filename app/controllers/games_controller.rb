require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:letters].chars
    @user_answer = params[:answer]
    url = "https://dictionary.lewagon.com/#{@user_answer}"
    test = JSON.parse(URI.open(url).read)
    if !(@user_answer.chars - @letters).empty?
      @result = "Sorry but #{@user_answer} can't be built out of #{@letters.join(', ')}."
    elsif !test['found']
      @result = "Sorry but #{@user_answer} does not seem to be a valide english word..."
    else
      @result = "Congratulations! #{@user_answer} is a valid English word..."
    end
  end
end
