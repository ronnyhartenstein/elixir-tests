
# WorkingWithMultipleProcesses-1, S.174

# elixir -r chain.exs -e "Chain.run(10)"
# elixir -r chain.exs -e "Chain.run(100)"
# elixir -r chain.exs -e "Chain.run(1000)"
# elixir -r chain.exs -e "Chain.run(10_000)"
# elixir -r chain.exs -e "Chain.run(400_000)" -> noo, "too many processes"
# elixir --erl "+P 1000000" -r chain.exs -e "Chain.run(400_000)"
# elixir --erl "+P 1000000" -r chain.exs -e "Chain.run(1_000_000)"

defmodule Chain do
  def counter(next_pid) do
    receive do
      n -> send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self,
            fn (_, send_to) ->
              spawn(Chain, :counter, [send_to])
            end

    # start the counter by sending
    send last, 0

    # and wait for the result to come back to us
    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end
