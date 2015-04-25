class QuestionsController < ApplicationController
  def show
    @question = DATA[params[:id].to_i]

  end
end
