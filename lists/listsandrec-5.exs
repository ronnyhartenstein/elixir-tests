
defmodule MyList do

  # ListsAndRecursion-5 (S.92)

  # Invokes the given fun for each item in the collection and
  # returns false if at least one invocation returns false.
  # Otherwise returns true.
  def all?(list, fun \\ fn x -> x end)
  when is_list(list) and is_function(fun) do
    _all?(list, fun)
  end
  defp _all?([], _fun), do: true
  defp _all?([itm | tail], fun), do: fun.(itm) && _all?(tail, fun)

  # Invokes the given fun for each item in the collection. Returns :ok.
  def each(list, fun)
  when is_list(list) and is_function(fun) do
    _each(list, fun)
  end
  defp _each([], _fun), do: :ok
  defp _each([itm | tail], fun) do
    fun.(itm)
    _each(tail, fun)
  end

  # Filters the collection, i.e. returns only those elements for
  # which fun returns true.
  def filter(list, fun)
  when is_list(list) and is_function(fun) do
    _filter(list, fun)
  end
  defp _filter([], _fun), do: []
  defp _filter([itm | tail], fun) do
    if fun.(itm) do
      [itm] ++ _filter(tail, fun)
    else
      _filter(tail, fun)
    end
  end

  # Splits the enumerable into two collections, leaving count
  # elements in the first one.
  def split(list, pos) do
    left = _split_till(list,pos)
    right = _split_from(list,0, pos)
    {left, right}
  end
  defp _split_till([], _num), do: []
  defp _split_till(_list, num) when num == 0, do: []
  defp _split_till([itm | tail], num) when num > 0, do: [itm] ++ _split_till(tail, num - 1)
  defp _split_from([], _num, _from), do: []
  defp _split_from([_ | tail], num, from) when num < from, do: _split_from(tail, num + 1, from)
  defp _split_from([itm | tail], num, from), do: [itm] ++ _split_from(tail, num + 1, from)

  # Takes the first count items from the collection.
  def take(list, count) do
    _take(list, count)
  end
  defp _take([], _), do: []
  defp _take(_, rest) when rest == 0, do: []
  defp _take([itm | tail], rest) , do: [itm] ++ _take(tail, rest - 1)

end



ExUnit.start

defmodule MyListTest do
  use ExUnit.Case

  test "all true in list?", do: assert MyList.all?([1,2,3], &(&1==&1))
  test "all true with no fun?", do: assert MyList.all?([1,2,3])
  test "not all true in list", do: refute MyList.all?([1,2,3], &(&1==2))
  test "all with a set", do: catch_error MyList.all?(%{bla: 1}, &(&1==&1))

  test "each", do: assert MyList.each([1,2,3], fn _ -> nil end) == :ok

  test "filter", do: assert MyList.filter([1,2,3], &(&1 <= 2)) == [1,2]
  test "filter all", do: assert MyList.filter([1,2,3], fn _ -> false end) == []
  test "filter none", do: assert MyList.filter([1,2,3], fn _ -> true end) == [1,2,3]

  test "split odd", do: assert MyList.split([1,2,3,4,5], 2) == {[1,2],[3,4,5]}
  test "split even", do: assert MyList.split([1,2,3,4], 2) == {[1,2],[3,4]}
  test "split chars", do: assert MyList.split('foobar', 3) == {'foo','bar'}

  test "take num", do: assert MyList.take([1,2,3,4,5], 3) == [1,2,3]
  test "take chars", do: assert MyList.take('foobar', 4) == 'foob'

end
