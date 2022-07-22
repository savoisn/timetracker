defmodule Timetracker.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Application.get_env(:timetracker, :event_store_port), []}
    ]

    Supervisor.start_link(children, strategy: :one_for_all)
  end
end
