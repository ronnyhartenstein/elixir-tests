
defmodule StrAndBin do

  # StringsAndBinaries-1, S. 112

  @space List.first ' '
  @tilde List.first '~'
  def onlyprintable?(chars) do
    #IO.inspect chars
    #IO.puts "teste #{chars} .."
    _printable(chars)
  end
  defp _printable([]), do: true
  defp _printable([char | tail])
  when char >= @space and char <= @tilde do
    _printable(tail)
  end
  defp _printable([_ | _]), do: false

end


ExUnit.start

defmodule StrAndBinTest do
  use ExUnit.Case, async: false

  test "onlyprintable" do
    assert StrAndBin.onlyprintable?('abc')
  end
  test "onlyprintable_err" do
    nonchar = List.first('~') + 1
    refute StrAndBin.onlyprintable?('ab' ++ [nonchar] ++ 'cd')
  end
  test "onlyprintable_err2" do
    refute StrAndBin.onlyprintable?(List.Chars.to_char_list("\x{0000}") )
  end
end
