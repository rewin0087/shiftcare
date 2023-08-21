module Source
  extend self

  # NOTE:
  # For improvements we can support different types of source
  #     like url and other type of format to read and parse later on.
  #     Can create logic to determine which adapter to return to parse data from source
  def read(source_path)
    File.new(source_path).call
  end
end
