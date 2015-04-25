class QuestionsController < ApplicationController
  before_filter :set_question

  def show
    choices = @question['correct'] + @question['incorrect']
    choices.shuffle!
    @question['choices'] = choices

  end

  def set_question
    @question = DATA[params[:id].to_i]
    not_found unless @question
  end

  def answer
    puts params[:id]
    @answer = {}
    @answer['content'] = params['answer']
    @answer['correct'] = @question['correct'].include? params['answer']
  end
end
