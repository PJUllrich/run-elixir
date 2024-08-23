defmodule ElixirByExampleTest do
  use ExUnit.Case
  doctest ElixirByExample

  test "greets the world" do
    assert ElixirByExample.hello() == :world
  end
end
