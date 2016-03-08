class Tag
  attr_accessor :intent_type, :name

  def initialize(options={})
    @intent_type = options.fetch(:intent_type)
    @name        = options.fetch(:name)
  end
end