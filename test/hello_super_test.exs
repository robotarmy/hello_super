defmodule HelloSuperTest do
  use ExUnit.Case
  doctest HelloSuper

  test "greets the world" do
    assert HelloSuper.hello() == :world
  end
end
