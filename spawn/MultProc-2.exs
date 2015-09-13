# WorkingWithMultipleProcesses-2, S.174

defmodule Spawn do
  import :timer, only: [ sleep: 1 ]

  def send_back() do
    receive do
      {sender, msg, wait} ->
        #if wait > 100 && wait < 500 do
        #  exit(:boom)
        #else
          sleep wait
          send sender, { :ok, msg }
        #end
    end
  end

  def run do

#    Process.flag(:trap_exit, true)

    pid1 = spawn(Spawn, :send_back, [])
    pid2 = spawn(Spawn, :send_back, [])
    pid3 = spawn(Spawn, :send_back, [])
    pid4 = spawn(Spawn, :send_back, [])

    send pid1, {self, "fred", 10}
    send pid2, {self, "betty", 150}
    send pid3, {self, "mia", 50}
    send pid4, {self, "lua", 1000}

    rec = fn ->
      receive do
        {:ok, message} ->
          IO.puts "return #{inspect message}"
        after 500 ->
          IO.puts "gone away"
      end
    end

    rec.()
    rec.()
    rec.()
    rec.()
  end
end
