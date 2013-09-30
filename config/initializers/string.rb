# Restart required even in development mode when you modify this file.

class String

  # fails on stressed sylables open > openning
  # put in exceptions if needed
  def ing
    return "offering" if self == "offer"
    return "savoring" if self == "savor"
    original = self
    if original.match(/ie$/)
      original.gsub!(/ie$/, "y")
    end
    if original.match(/([^aeiou])([aeiou])([^aeiou])$/)
      original.gsub!(/([^aeiou])([aeiou])([^aeiouy])$/, "\\1\\2\\3\\3")
    end
    if original.match(/([^aeiou])e$/)
      original = original[0...-1]  # strip off e
    end
    original + "ing"
  end

  def s
    return "works of art" if self == "work of art"
    self.pluralize
  end

  def ed
    self + "ed"
  end

  def ly
    original = self
    if original.match(/ic$/)
      original.gsub!(/ic$/, "ical")
    end
    if original.match(/y$/)
      original.gsub!(/y$/, "i")
    end
    if original.match(/([^aeiou])le$/)
      original = original[0...-2]
    end
    original + "ly"
  end

  def article
    self.match(/^[aeiou]/i) ? "an" : "a"
  end

end
