class QuizesController < ApplicationController
  before_filter :set_quiz
  def show
    @quiz['questions'].map! { |id| Question.new @data['questions'][id] }
  end

  def set_quiz
    @quiz = @data['quizes'][params[:id].to_i]
    not_found unless @quiz
  end
end
