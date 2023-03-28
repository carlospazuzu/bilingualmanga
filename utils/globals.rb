class Globals
  attr_reader :data

  private_class_method :new

  def initialize
    @data = {}
  end

  def self.instance
    @instance ||= new
  end

  def set(key, value)
    @data[key] = value
  end

  def get(key)
    @data[key]
  end
end
