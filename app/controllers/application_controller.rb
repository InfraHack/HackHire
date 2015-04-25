class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_data

  def set_data
    @data = {'questions' => {}, 'quizes' => {}}

    Dir[Rails.root.join('data', 'questions', '*.json')].each do |question|
      json = JSON.parse File.read(question)
      @data['questions'][json['id']] = json
    end

    Dir[Rails.root.join('data', 'quizes', '*.json')].each do |question|
      json = JSON.parse File.read(question)
      @data['quizes'][json['id']] = json
    end
  end

  def not_found
    fail ActionController::RoutingError.new 'Not Found'
  end
end
