
defmodule MyList do

  # ListsAndRecursion-6 (S.92)

  def flatten(listoflists) do
    flat = _flatten(listoflists)
    #Enum.reverse flat # not necessary :)
  end
  defp _flatten(itm) when not is_list(itm), do: [itm]
  defp _flatten([]), do: []
  defp _flatten([itm | tail]) when is_list(itm), do: _flatten(itm) ++ _flatten(tail)
  defp _flatten([itm | tail]), do: [itm] ++ _flatten(tail)

end



ExUnit.start

defmodule MyListTest do
  use ExUnit.Case

  test "flatten chars", do: assert MyList.flatten(['ab','cd',['ef','gh'],'ij']) == 'abcdefghij'
  test "flatten nums", do: assert MyList.flatten([1,[2,3,[4],5,[[[6]]]]]) == [1,2,3,4,5,6]
end
