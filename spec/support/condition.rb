class Condition
  attr_accessor :name
  def initialize(options={})
    @name = options.fetch(:name)
  end
end