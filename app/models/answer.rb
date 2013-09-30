class Answer

  def initialize(string)
    string = string.delete("Q")
    @number = string[0]
    @can_modify = @number.to_i.even?
    answer = string.delete(@number)
    @answer = "Q" + @number.next + answer
    if @can_modify
      @current = @answer[-1]
      @answer.chop!
    end
  end

  attr_reader :number, :answer, :current, :can_modify

  def klass
    Scale.klasses[(@number.to_i-1)/2]
  end

  def signal
    raise unless @can_modify
    klass.new(@current)
  end

  def method_missing(method, *args, &block)
    if klass.respond_to?(method)
      klass.send(method)
    else
      super
    end
  end

  def type_string
    raise unless @number == "9"
    @answer.delete("Q10")
  end

end
