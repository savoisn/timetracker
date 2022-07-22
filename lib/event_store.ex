defmodule EventStore do
  @callback start_link([any]) :: pid

  @callback list :: [Event]

  @callback add_event(Event) :: nil
end
