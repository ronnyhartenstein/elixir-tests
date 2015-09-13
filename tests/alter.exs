
# habe eine Person (Map: name, alter)
# mappe Alter auf Begriffe
# <=3 Baby, <= 6 Kleinkind, <= 12 Kind, <= 18 Jugendlicher, sonst Erwachsener

defmodule Alter do
  def bestimmen(%{alter: a}) when a <= 3, do: "Baby"
  def bestimmen(%{alter: a}) when a <= 6, do: "Kleinkind"
  def bestimmen(%{alter: a}) when a <= 12, do: "Kind"
  def bestimmen(%{alter: a}) when a <= 18, do: "Jugendlicher"
  def bestimmen(%{alter: _}), do: "Erwachsener"
end


leute = [
  %{name: "A", alter: 3},
  %{name: "B", alter: 8},
  %{name: "C", alter: 14}
]

# for p = %{alter: a} <- leute,
#   a > 1,
#   do: IO.puts(Alter.bestimmen p)

# leute |> Enum.each( &( &1 |> Alter.bestimmen |> IO.inspect))
