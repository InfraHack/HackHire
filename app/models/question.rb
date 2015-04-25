class Question < SimpleDelegator
  def initialize(object)
    @object = object
    super @object
  end

  def choices
    return @choices if @choices
    @choices = correct + incorrect
    @choices.shuffle!
    @choices = @choices[0..3]
  end

  %w(correct incorrect id prompt).each do |method_name|
    define_method method_name do
      self[method_name]
    end

    define_method "#{method_name}=" do |value|
      self[method_name] = value
    end
  end
end
