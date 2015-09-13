defmodule FibSolver do

  def fib(anzahl) do
    liste = for n <- 1..anzahl, into: [], do: fib_calc(n)
    IO.inspect liste
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)

end


FibSolver.fib(37)
