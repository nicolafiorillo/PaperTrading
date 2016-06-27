defmodule PaperTrading.Util.Date do
  use Timex

  def utc_now() do
    Date.now
    |> Timex.to_erlang_datetime
    |> Ecto.DateTime.from_erl
  end
end
