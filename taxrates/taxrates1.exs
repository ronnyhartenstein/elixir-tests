
defmodule TaxCalc do
  def total(tax_rates, orders) do
    for order <- orders, do: total_amount(tax_rates, order)
  end

  def total_amount(tax_rates, order) do
    hastax = hastaxrate(tax_rates, order[:ship_to])
    tax_rate = taxrate(tax_rates, order[:ship_to], hastax)
    tax = calctax(order[:net_amount], tax_rate)
    [ { :total_amount, order[:net_amount] + tax } | order ]
  end

  def hastaxrate(tax_rates, ship_to) do
    m = Enum.into tax_rates, %{}
    taxcities = Map.keys(m)
    Enum.member?(taxcities, ship_to)
  end

  def taxrate(_, _, false) do
    0.0
  end
  def taxrate(tax_rates, ship_to, true) do
    tax_rates[ship_to]
  end

  def calctax(net_amount, tax_rate) do
    net_amount * tax_rate
  end

  def dump(tax_rates) do
    Enum.map tax_rates, fn {wo, was} -> IO.puts("#{wo} - #{was}") end
  end
end


tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :DC, net_amount: 44.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ]
]

# TaxCalc.dump tax_rates
orders_wtax = TaxCalc.total tax_rates, orders
IO.inspect orders_wtax
