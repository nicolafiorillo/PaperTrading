defmodule PaperTrading.CurrencyProvider do
  use GenServer

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def update do
    GenServer.cast(__MODULE__, :update)
  end

  def handle_cast(:update, state) do
    IO.inspect "Updating..."
    {:noreply, state}
  end
end
