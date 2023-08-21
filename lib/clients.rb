require 'json'

class Clients
  DEFAULT_SOURCE_PATH = File.join(File.expand_path(File.dirname(__FILE__)), '..', 'data', 'clients.json')

  # NOTE:
  # Currently source_path is default from specified storage,
  #  but we can pass a different file path with the same content structure.
  # We also support custom filter from params
  #  just pass { filter: 'field:value' }
  def initialize(source_path: DEFAULT_SOURCE_PATH)
    @source_path = source_path
  end

  def filter(params)
    filter_key, filter_value = params[:filter].to_s.split(':')

    result = parsed_data.filter do |item|
      partial_match?(item[:full_name], params[:name]) ||
        partial_match?(item[filter_key&.to_sym], filter_value)
    end

    Result.new(result).call
  end

  private

  attr_reader :source_path

  def parsed_data
    @parsed_data ||= JSON.parse(Source.read(source_path), symbolize_names: true)
  end

  def sanitize_value(value)
    value.downcase.strip
  end

  def partial_match?(target, source)
    return false unless target
    return false unless source

    target.downcase.include?(sanitize_value(source))
  end
end
