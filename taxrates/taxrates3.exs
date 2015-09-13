
defmodule TaxCalc do
  def total(tax_rates, orders) do
    for order <- orders, do: [ { :total_amount, total_amount(tax_rates, order) } | order ]
  end

  def total_amount(tax_rates, order) do
    tax_rates
      |> hastaxrate(order[:ship_to])
      |> taxrate(order[:ship_to])
      |> calctax(order[:net_amount])
      |> calctotal(order[:net_amount])
  end

  def hastaxrate(tax_rates, ship_to) do
    m = Enum.into tax_rates, %{}
    taxcities = Map.keys(m)
    {Enum.member?(taxcities, ship_to), tax_rates}
  end

  def taxrate({false, _}, _) do
    0.0
  end
  def taxrate({true, tax_rates}, ship_to) do
    tax_rates[ship_to]
  end

  def calctax(tax_rate, net_amount) do
    net_amount * tax_rate
  end

  def calctotal(tax_amount, net_amount) do
    net_amount + tax_amount
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
