module Source
  class File
    def initialize(source_path)
      @source_path = source_path
    end

    def call
      ::File.read(source_path)
    end

    private

    attr_reader :source_path
  end
end
