
defmodule Order do
  @derive Access
  defstruct id: 0, ship_to: :XX, net_amount: 0.0, total_amount: 0.0
end
