defmodule Surveyraiser.Util.Date do
  use Timex

  def utc_now_with_delay(delay) when is_number(delay) do
      Date.now
      |> Timex.add(Time.to_timestamp(delay, :seconds))
      |> Timex.to_erlang_datetime
      |> Ecto.DateTime.from_erl
  end

  def utc_now() do
    Date.now
    |> Timex.to_erlang_datetime
    |> Ecto.DateTime.from_erl
  end

  def lap_from_now(days_lap) do
      {mega, secs, _} = :os.timestamp()
      mega * 1000000 + secs + (60 * 60 * 24 * days_lap)
  end

  def is_utc?(date) when is_bitstring(date) do
    case Timex.parse(date, "{ISO:Extended}") do
      {:ok, _} -> true
      _        -> false
    end
  end
end
