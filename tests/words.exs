
defmodule DictWords do
  @wordfile "/usr/share/dict/words"

  # S.93
  def as_list do
    x = File.read!(@wordfile)
      |> String.split
      |> Enum.max_by(&String.length/1)
    IO.inspect x
  end

  # S.95
  def as_stream do
    x = File.open!(@wordfile)
      |> IO.stream(:line)
      |> Enum.max_by(&String.length/1)
    IO.inspect x
  end
end


#DictWords.as_list
DictWords.as_stream
