defmodule Chop do
  @docalgo """
     num zw. min und max und in unterer hälfte -> fun(num, min, max-min / 2)
     num zw. min und max und in oberer hälfte -> fun(num, max-min / 2, max)
     num < min oder num > max -> :fehler

  """

  def guess(num, min..max) when min == max or min+1 == max do
    IO.puts "#{min} fast #{max}???!"
    :fehler
  end

  def guess(num, min..max) when max == num and min == num do
    IO.puts "#{num} gefunden!"
    :ok
  end

  def guess(num, min..max) when min > num or max < num do
    IO.puts "#{min}..#{max} außer Rand und Band!"
    :fehler
  end

  def guess(num, min..max) when div(max - min, 2) > num do
    IO.puts "#{min}..#{max} zu gross, probiere tiefer"
    guess(num, min .. div(max - min, 2))
  end

  def guess(num, min..max) when div(max - min, 2) < num do
    IO.puts "#{min}..#{max} zu klein, probiere höher"
    guess(num, min + div(max - min, 2) .. max)
  end



end

finde = 132
IO.puts "finde #{finde}"
Chop.guess(finde, 1..1000)
