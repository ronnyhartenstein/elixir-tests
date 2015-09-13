
defmodule MyList do

  # with accumulator
  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head+total)

  # ListAndRecursion-1 (S.69) - without accumulator
  def sum2(list), do: _sum2(list)
  defp _sum2([]), do: 0
  defp _sum2([head | tail]), do: head + _sum2(tail)

  # ListAndRecursion-2 (S.69)
  def mapsum(list, fun), do: _mapsum(list, fun)
  defp _mapsum([], _), do: 0
  defp _mapsum([head | tail], fun), do: fun.(head) + _mapsum(tail, fun)

  # ListAndRecursion-3 (S.69)
  @a List.first 'a'
  @z List.first 'z'
  def caesar(list, n), do: _caesar(list,n)
  defp _caesar([], _), do: []
  defp _caesar([head | tail], n), do: [ _char(head, n) | _caesar(tail, n) ]
  defp _char(c, n) when c + n >= @a and c + n <= @z, do: c + n
  defp _char(c, n), do: @a + rem(c + n, @z)

  #defp _char(c, n) when c + n in 'abcdefghijklmnopqrstuvwxyz' do
  #defp _char(c, n) when c + n >= 97 and c + n <= 122 do
  #defp _char(c, n) when [c + n] >= ['a'] and [c + n] <= ['z'] do # in 'abcdefghijklmnopqrstuvwxyz' do
  # funzt..
  # defp _char(c, n) when c + n >= @a and c + n <= @z do
  #   x = c + n
  #   IO.puts "as is #{c}+#{n} -> #{x} #{[x]}"
  #   x
  # end
  # defp _char(c, n) do # when # x > 122 do #'z' do # > 122 geht auch nicht
  #   #x =  'a' + rem(c + n, 'z')
  #   #x = 97 + rem(c + n, 122) # geht
  #   x = @a + rem(c + n, @z)
  #   #IO.write rem(c + n, 122)
  #   IO.puts "wrap #{c}+#{n}=#{c+n} -> #{x} #{[x]}"
  #   x
  # end

  # ListAndRecursion-4 (S.72)
  def span(from, to) when from < to, do: _span(from, to)
  defp _span(from, to) when from == to, do: [to]
  defp _span(from, to), do: [from | _span(from + 1, to)]
end

#MyList.sum([1,2,3])
#MyList.mapsum [1,2,3], &(&1*&1)

#IO.write "from a "
#IO.write :io.format("~w~n",['a'])  # 97
#IO.write " to z "
#IO.write :io.format("~w~n",['z']) # 122
MyList.caesar 'ryvkve', 13

#MyList.span(2,5)
