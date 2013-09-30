class Sig # Signal is taken

  def self.symbols
    [:L, :l, :r, :R]
  end

  def self.labels
    %w{Introvert ExtrovertedIntrovert IntrovertedExtrovert Extrovert}
  end

  def self.a
    self.new_from_index(0).label
  end
  def self.b
    self.new_from_index(1).label
  end
  def self.c
    self.new_from_index(2).label
  end
  def self.d
    self.new_from_index(3).label
  end

  def initialize(symbol)
    symbol = symbol.to_sym if symbol.is_a?(String)
    @symbol = symbol
    @index = self.class.symbols.index(symbol)
  end
  attr_reader :index, :symbol

  def self.new_from_index(index)
    new(self.symbols[index])
  end

  def self.all
    self.symbols.collect{|sym| new(sym)}
  end

  include Comparable
  def <=>(other)
    self.index<=>other.index
  end

  def label
    self.class.labels[@index]
  end

  def full_name
    label + " (#{mbti})"
  end

  def left?
    [0,1].include? @index
  end

  def hybrid?
    [1,2].include? @index
  end

  def partial_name
    side = left? ? "_left" : "_right"
    self.class.name.downcase + side + (hybrid? ? "_hybrid" : side)
  end

  def mbti
    self.class.mbti[@index]
  end

end
