
fizz = fn
  0, 0, _ -> IO.puts "FizzBuzz"
  0, _, _ -> IO.puts "Fizz"
  _, 0, _ -> IO.puts "Buzz"
  _, _, x -> IO.puts x
end

#fizz.(1,0,1)
#fizz.(0,1,1)
#fizz.(0,0,1)
#fizz.(1,1,1)

fizzrem = fn n ->
  fizz.(rem(n,3), rem(n,5), n)
end

fizzrem.(10)
fizzrem.(11)
fizzrem.(12)
fizzrem.(13)
fizzrem.(14)
fizzrem.(15)
fizzrem.(16)
fizzrem.(17)
