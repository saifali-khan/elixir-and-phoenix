defmodule JustDialTest do
  use ExUnit.Case
  doctest JustDial

  test "greets the world" do
    assert JustDial.hello() == :world
  end
end
