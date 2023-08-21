class DataFinder
  def initialize(options)
    @options = options
  end

  def call
    Clients.new.filter(options)
  end

  private

  attr_reader :options
end
