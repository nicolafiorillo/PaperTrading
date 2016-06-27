defmodule PaperTrading do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(PaperTrading.CurrencyProvider, [nil])
    ]

    options = [strategy: :one_for_one, name: PaperTrading.Supervisor]
    Supervisor.start_link(children, options)
  end
end
