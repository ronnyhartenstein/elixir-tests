# Aufruf: elixir -r "*.ex" taxrates6.exs

# ListsAndRecursion-8, S.104

defmodule TaxCalc do

  @tax_rates [ NC: 0.075, TX: 0.08 ]

  def total(orders) do
    for order <- orders, do: %Order{ order | total_amount: total_amount(order) }
  end

  def total_amount(order) do
    order
      |> hastaxrate
      |> taxrate
      |> calctax
      |> calctotal
  end

  def hastaxrate(order) do
    taxcities = Map.keys( Enum.into @tax_rates, %{} )
    {order, Enum.member?(taxcities, order[:ship_to])}
  end

  def taxrate({order, false}) do
    {order, 0.0}
  end
  def taxrate({order, true}) do
    {order, @tax_rates[order[:ship_to]]}
  end

  def calctax({order, tax_rate}) do
    {order, order[:net_amount] * tax_rate}
  end

  def calctotal({order, tax_amount}) do
    order[:net_amount] + tax_amount
  end

end


orders = [
  %Order{ id: 123, ship_to: :NC, net_amount: 100.00 },
  %Order{ id: 124, ship_to: :DC, net_amount: 44.50 },
  %Order{ id: 125, ship_to: :TX, net_amount: 24.00 }
]

# TaxCalc.dump tax_rates
orders_wtax = TaxCalc.total orders
IO.inspect orders_wtax
