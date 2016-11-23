require "nmax/version"

module Nmax
  MEMORY_PAGE_SIZE = 4096 #getconf PAGESIZE
  CHUNK_SIZE       = 8*MEMORY_PAGE_SIZE
  NUMBER_OF_DIGITS = 1_000
  DEFAULT_N        = 10

  class << self
    def nmax(stream, n = nil)
      n = n.to_i > 0 ? n.to_i : DEFAULT_N
      result = []

      while chunk = stream.read(CHUNK_SIZE)
        chunk   =  finalize_read_number(stream, chunk)
        result  += get_numbers(chunk)
        result  =  maximum_from(result, n)
      end

      result
    end

    def finalize_read_number(stream, chunk)
      while chunk[-1][/\d/] && (next_char = stream.read(1)) && next_char[/\d/]
        chunk += next_char
      end

      chunk
    end

    def get_numbers(string)
      string.scan(/\d{1,#{NUMBER_OF_DIGITS}}/).map(&:to_i)
    end

    def maximum_from(numbers, n)
      numbers.max(n)
    end
  end
end
