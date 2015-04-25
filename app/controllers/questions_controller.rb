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
    render :ok, json: { 'content' => [], 'correct' => false } if params['answers'].empty?
    @answer['content'] = params['answers']
    correct_options = params['choices'] & @question['correct']
    @answer['correct'] = correct_options.sort == params['answers'].sort

    render :ok, json: @answer and return
  end
end
