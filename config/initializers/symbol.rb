# Restart required even in development mode when you modify this file.

class Symbol

  # create a new class instance from a symbol
  # e.g. symbol.to_klass_name => KlassName.new(sym)
  def method_missing(method, *args, &block)
    if %w{to_str to_ary to_int}.include?(method.to_s) # don't override
      super
    elsif method.to_s =~ /^to_([a-z_]{3,})$/
      run_to_klass($1, *args, &block)
    else
      super
    end
  end
  def respond_to?(method)
    if %w{to_str to_ary to_int}.include?(method.to_s) # don't override
      super
    elsif method.to_s =~ /^to_([a-z_]{3,})$/
      true
    else
      super
    end
  end
  def run_to_klass(klass)
    klass.camelize.constantize.new(self)
  end

  # convenient string methods

  # concatenating symbols
  # e.g. :E + :N => :EN
  def +(other)
    (self.to_s + other.to_s).to_sym
  end

  # subsymbols
  # e.g. :EN[0] => :E   :ENT[1,2] => :NT
  def [](*args)
    self.to_s[*args].to_sym
  end

end
