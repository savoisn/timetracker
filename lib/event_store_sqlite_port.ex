defmodule EventStoreSqlitePort do
  use Agent
  @behaviour EventStore

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def list do
    Agent.get(__MODULE__, fn state ->
      state
    end)
  end

  def add_event(%Event{} = evt) do
    Agent.update(__MODULE__, fn state ->
      [evt | state]
    end)
  end
end
