
defmodule Prime do
  def search(from, to) do
    @TODO ' als Stream implementieren '
    Stream.iterate(from, )
    #for n <- from .. to, _isprime?(n, n-1), into: [], do: n
  end

  # Primzahl: nur durch 1 und sich selbst teilbar
  defp _isprime?(_, 0), do: false
  defp _isprime?(n, 1) when n > 2, do: true
  defp _isprime?(_, 1), do: false # für 2 :(
  defp _isprime?(n, num) when rem(n, num) == 0, do: false
  defp _isprime?(n, num), do: _isprime?(n, num - 1)

end


ExUnit.start

defmodule PrimeTest do
  use ExUnit.Case

  test "to10" do
    assert Prime.search(1,10) == [3,5,7]
  end
end
