
defmodule Parse do
  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str),           do: _number_digits(str,  0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end



ExUnit.start

defmodule StrAndBinTest do
  use ExUnit.Case

  test "normal" do
    assert Parse.number('123') == 123
  end
  test "plus" do
    assert Parse.number('+123') == 123
  end
  test "minus" do
    assert Parse.number('-123') == -123
  end
  test "plus9" do
    assert Parse.number('+9') == 9
  end
  test "char" do
    assert catch_error(Parse.number('+a')) == %RuntimeError{message: "Invalid digit 'a'"}
  end
  test "innerchar" do
    assert catch_error(Parse.number('+12a3')) == %RuntimeError{message: "Invalid digit 'a'"}
  end
end
