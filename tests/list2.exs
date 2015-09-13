
defmodule MyList do

  # ListAndRecursion-3 (S.69)
  def caesar(list, n), do: _caesar(list,n)
  defp _caesar([], _), do: []
  defp _caesar([head | tail], n), do: [ _char(head, n) | _caesar(tail, n) ]
  defp _char(c, n) when c + n >= ?a and c + n <= ?z, do: c + n
  defp _char(c, n), do: ?a + rem(c + n, ?z)

end

IO.puts MyList.caesar 'ryvkve', 13
