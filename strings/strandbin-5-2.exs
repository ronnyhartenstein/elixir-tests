
defmodule StrAndBin do
  import Integer

  # StringsAndBinaries-5, S. 119
  def justify(listofwords) do
    linelen = Enum.reduce(listofwords, 0, fn(s, len) ->
      (if String.length(s) >= len, do: String.length(s), else: len)
    end)
    rows = for word <- listofwords, is_bitstring(word),
      into: [],
      do: _justify(word, String.length(word), linelen)
    Enum.join(rows, "\n")
  end

  defp _justify(word, wordlen, linelen) when is_odd(wordlen) do
    _proc(word, wordlen, linelen, 1, 0)
  end
  defp _justify(word, wordlen, linelen) when is_even(wordlen) do
    _proc(word, wordlen, linelen, 0, 1)
  end
  defp _proc(word, wordlen, linelen, wordcor, slicecor) do
    half = _float2int((wordlen - wordcor) / 2)
    len = _float2int(linelen / 2)
    lstr = String.slice(word, 0 .. (half - slicecor))
    rstr = String.slice(word, (half * -1) .. -1)
    left = String.rjust(lstr, len)
    right = String.ljust(rstr, len)
    left <> right
  end
  defp _float2int(flt) when is_float(flt) do
    {int, _} = Integer.parse Float.to_string(flt, [decimals: 0])
    int
  end
end


ExUnit.start

defmodule StrAndBinTest do
  use ExUnit.Case

  test "justify" do
    words = ["cat","mooo","zebra","elephant"]
    str = Enum.join ["  cat   ","  mooo  "," zebra  ","elephant"], "\n"
    assert StrAndBin.justify(words) == str
  end
end
