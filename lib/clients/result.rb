class Clients
  class Result
    def initialize(filtered_result)
      @filtered_result = filtered_result
      @output = {}
    end

    def call
      grouped_by_email = filtered_result.group_by { |item| item[:email] }

      unless (result = flatten_result(grouped_by_email.filter { |_, items| items.count > 1 })).empty?
        @output[:duplicate_result_based_from_email] = result
      end

      unless (result = flatten_result(grouped_by_email.filter { |_, items| items.count == 1 })).empty?
        @output[:result] = result
      end

      output
    end

    private

    attr_reader :filtered_result, :output

    def flatten_result(list)
      list.values.flatten
    end
  end
end
