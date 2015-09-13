
defmodule Prime do
  def search(from, to) do
    prime = []
    none = []
    for n <- from .. to, do: [prime, none] = _checkprime(n, prime, none)
    prime
  end

  defp _checkprime(n, prime, none) do
    if _isprime?(n, prime, none) do
      prime = [ n | prime ]
    else
      none = [ n | none ]
    end
    [prime, none]
  end

  # Primzahl: nur durch sich teilbar
  defp _isprime?(n, prime, none) do
    divbyprime = _divideby?(n, prime)
    divbynone = _divideby?(n, none)
    not (divbyprime and divbynone)
  end
  defp _divideby?(_, []), do: false
  defp _divideby?(n, [num | _]) when rem(n, num) == 0, do: true
  defp _divideby?(n, [_ | tail]), do: _divideby?(n, tail)

end


ExUnit.start

defmodule PrimeTest do
  use ExUnit.Case

  test "to10" do
    assert Prime.search(1,10) == [1,3,5,7,9]
  end
end
