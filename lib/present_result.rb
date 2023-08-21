class PresentResult
  def initialize(result)
    @result = result
  end

  def call
    result.each do |key, items|
      puts key.to_s.gsub('_', ' ').capitalize
      puts items
      puts "\n"
    end
  end

  private

  attr_reader :result
end
