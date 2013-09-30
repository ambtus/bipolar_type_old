class Mind < Sig

  def self.mbti
    %w{INTJ ENTP INTP ENTJ}
  end

  def self.labels
    %w{Analyst Debater Scientist Winner}
  end

  def self.left_response
    "know the truth"
  end

  def self.right_response
    "win the argument"
  end

  def self.left_left
    "lose the argument"
  end

  def self.right_right
    "believe a lie"
  end


end
