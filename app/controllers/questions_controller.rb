class QuestionsController < ApplicationController
  before_filter :set_question

  def show
  end

  def set_question
    id = params[:id] || params[:question_id]
    question = @data['questions'][id.to_i]
    not_found unless question
    @question = Question.new question
  end

  def answer
    @answer = {}
    @answer['content'] = params['answer']
    @answer['correct'] = @question['correct'].include? params['answer']
    render :ok, json: @answer and return
  end
end
