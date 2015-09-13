
defmodule TaxCalc do
  def total(tax_rates, orders) do
    for order <- orders, do: [ { :total_amount, total_amount(tax_rates, order) } | order ]
  end

  def total_amount(tax_rates, order) do
    order
      |> hastaxrate(tax_rates)
      |> taxrate(tax_rates)
      |> calctax
      |> calctotal
  end

  def hastaxrate(order, tax_rates) do
    ship_to = order[:ship_to]
    m = Enum.into tax_rates, %{}
    taxcities = Map.keys(m)
    {Enum.member?(taxcities, ship_to), order}
  end

  def taxrate({false, order}, _) do
    {0.0, order}
  end
  def taxrate({true, order}, tax_rates) do
    {tax_rates[order[:ship_to]], order}
  end

  def calctax({tax_rate, order}) do
    {order[:net_amount] * tax_rate, order}
  end

  def calctotal({tax_amount, order}) do
    order[:net_amount] + tax_amount
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
