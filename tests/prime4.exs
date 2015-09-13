
# ListsAndRecursion-7, S. 104

defmodule Prime do
  def search(from, to) do
    # Prim wenn durch sich selbst und 1 restlos teilbar,
    # und sonst nur mit Restwert
    alle = Enum.to_list(from .. to)
    teilbar = for n <- from .. to, m <- from .. to,
      m < n && n > 1, # Filter 1
      m > 1 && rem(n,m) == 0, # Filter 2
      into: [], do: n
    alle -- teilbar
  end
end


ExUnit.start

defmodule PrimeTest do
  use ExUnit.Case

  test "to10" do
    assert Prime.search(1,10) == [1,2,3,5,7]
  end
end
