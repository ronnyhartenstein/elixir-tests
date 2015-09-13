
defmodule StrAndBin do
  @splitpoint ". "
  def capitalize_sentences(str) do
    parts = String.split str, @splitpoint
    parts_ucf = for part <- parts, into: [], do: String.capitalize(part)
    Enum.join parts_ucf, @splitpoint
  end
end


ExUnit.start

defmodule StrAndBinTest do
  use ExUnit.Case

  test "capitalize" do
    assert StrAndBin.capitalize_sentences("oh. a DOG. woof. ") == "Oh. A dog. Woof. "
  end
end
