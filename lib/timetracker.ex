defmodule Timetracker do
  alias Timetracker.Task

  @event_store Application.get_env(:timetracker, :event_store_port)

  def start(tags) do
    @event_store.add_event(%Event{
      topic: :start,
      payload: %{
        start_date: DateTime.now!("Etc/UTC"),
        tags: tags
      }
    })
  end

  def list_all() do
    @event_store.list()
    |> Enum.filter(fn %Event{topic: topic} ->
      topic == :start
    end)
    |> Enum.map(fn evt ->
      %Task{
        tags: evt.payload.tags,
        start_date: evt.payload.start_date,
        end_date: DateTime.now!("Etc/UTC")
      }
    end)
  end
end
