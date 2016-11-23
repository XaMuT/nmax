require 'test_helper'

class NmaxTest < Minitest::Test
  def stream
    @stream ||= StringIO.new("abc123456d78abc97d99efghijklm100opq95 98")
  end

  def test_finalize_read_number
    chunk     = stream.read(4)
    finalized = "abc123456"

    assert_equal finalized, Nmax.finalize_read_number(stream, chunk)
  end

  def test_maximum_from
    arr     = [1, 2, 3, 4, 5]
    max_arr = [5, 4]

    assert_equal max_arr, Nmax.maximum_from(arr, 2)
  end

  def test_get_numbers
    string  = stream.string
    numbers = [123456, 78, 97, 99, 100, 95, 98]

    assert_equal numbers, Nmax.get_numbers(string)
  end

  def test_nmax
    assert_equal [123456, 100, 99, 98, 97], Nmax.nmax(stream, 5)
  end

  def test_nmax_use_default_n
    assert_equal [123456, 100, 99, 98, 97, 95, 78], Nmax.nmax(stream)
  end
end
