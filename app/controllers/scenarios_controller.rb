class ScenariosController < ApplicationController
  skip_before_filter :set_question
  before_filter :set_scenario
  def show
  end

  def set_scenario
    @scenario = @data['scenarios'][params[:id].to_i]
    not_found unless @scenario
  end
end
