
defmodule StrAndBin do
  #import String

  # StringsAndBinaries-5, S. 119
  def justify(listofwords) do
    linelen = _longest(listofwords)
    rows = for word <- listofwords, is_bitstring(word),
      into: [],
      do: _justify(word, linelen)
    Enum.join(rows, "\n")
  end

  defp _longest(list, longest \\ 0)
  defp _longest([], longest), do: longest
  defp _longest([itm | tail], longest) when is_bitstring(itm) do
    len = String.length itm
    if len > longest do
      _longest(tail, len)
    else
      _longest(tail, longest)
    end
  end

  defp _justify(word, linelen) when is_bitstring(word) do
    spaces = linelen - String.length(word)
    row = if rem(spaces, 2) == 0 do
      _sp(spaces / 2) <> word <> _sp(spaces / 2)
    else
      _sp((spaces - 1) / 2) <> word <> _sp((spaces + 1) / 2)
    end
    row
  end
  defp _sp(int) when is_integer(int), do: String.duplicate(" ", int)
  defp _sp(flt) when is_float(flt) do
      {int, _} = Integer.parse Float.to_string(flt, [decimals: 0])
      _sp int
  end
  defp _sp(what), do: raise "woot? #{what}"
end


ExUnit.start

defmodule StrAndBinTest do
  use ExUnit.Case

  test "justify" do
    words = ["cat","zebra","elephant"]
    str = Enum.join ["  cat   "," zebra  ","elephant"], "\n"
    assert StrAndBin.justify(words) == str
  end
end
