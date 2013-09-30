class Type
  def initialize(string)
    raise unless string.length == 4
    @symbol = string.to_sym
    @scales = 4.times.collect do |i|
      Scale.klasses[i].new(string[i])
    end
  end

  attr_reader :symbol, :scales

  def name
    @scales.collect{|s| s.label}.join
  end

  def modify_focus(scale)
    letters = @symbol.to_s.scan(/./)
    index = Scale.klasses.index(scale)
    scale = @scales[index]
    raise unless scale.ambi?
    letters[index] = scale.left? ? "r" : "l"
    Type.new(letters.join.to_sym)
  end

  def modify_stability(scale)
    letters = @symbol.to_s.scan(/./)
    index = Scale.klasses.index(scale)
    scale = @scales[index]
    raise unless scale.ambi?
    letters[index] = scale.left? ? "L" : "R"
    Type.new(letters.join.to_sym)
  end

  def soften(scale)
    letters = @symbol.to_s.scan(/./)
    index = Scale.klasses.index(scale)
    scale = @scales[index]
    raise if scale.ambi?
    letters[index] = scale.symbol.to_s.downcase
    Type.new(letters.join.to_sym)
  end

end
