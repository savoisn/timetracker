defmodule TimetrackerTest do
  use ExUnit.Case
  doctest Timetracker

  alias Timetracker.Task

  test "start a task" do
    Timetracker.start(["task_type", "task_name", "task_tag"])

    [%Task{tags: tags, start_date: _, end_date: _}] = Timetracker.list_all()

    assert(length(tags) == 3)
  end
end
