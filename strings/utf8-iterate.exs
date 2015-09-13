
defmodule Utf8 do
  def each(str, func) when is_binary(str), do: _each(str, func)

  defp _each(<< head :: utf8, tail :: binary >>, func) do
    func.(head)
    _each(tail, func)
  end

  defp _each(<<>>, _func), do: []
end




ExUnit.start

defmodule Utf8Test do
  use ExUnit.Case

  test "utf8" do
    assert Utf8.each "äog", fn char -> true end
  end
end
