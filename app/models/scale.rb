class Scale

  def self.klasses
    [Soul, Mind, Body, Heart]
  end

  def self.index(scale)
    self.klasses.index(scale.class)
  end

end
