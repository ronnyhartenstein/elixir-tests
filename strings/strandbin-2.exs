
defmodule StrAndBin do
  import String

  # StringsAndBinaries-2, S. 114
  def anagram?(word1, word2) do
    x = word1 == Enum.reverse word2
    y = word1 == word2
    x && y
  end
end


ExUnit.start

defmodule StrAndBinTest do
  use ExUnit.Case, async: false

  test "anagram_even" do
    assert StrAndBin.anagram?('anna', 'anna')
  end
  test "anagram_odd" do
    assert StrAndBin.anagram?('anina', 'anina')
  end
  test "annagram_err" do
    refute StrAndBin.anagram?('abcd', 'dcba')
  end
end
