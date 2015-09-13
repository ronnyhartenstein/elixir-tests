defmodule Attendee do
  defstruct name: "", paid: false, over_18: true
  def paid?(attendee = %Attendee{}) do
    attendee.paid
  end

  def entrance!(%Attendee{name: name, paid: paid}) when paid == true do
    IO.puts "#{name} geht rein"
  end
  def entrance!(_) do
    raise "nicht bezahlt"
  end
end

#a1 = %Attendee{name: "Dave", over_18: true}
#IO.puts "has paid #{a1} ", Attendee.paid?(a1)

#a1 = %Attendee{name: "Dave", over_18: true}
#a2 = %Attendee{a1 | paid: true}
#IO.puts Attendee.paid?(a2)
#Attendee.entrance a1
#Attendee.entrance a2 
