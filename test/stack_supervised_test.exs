defmodule StackSupervisedTest do
  use ExUnit.Case
  doctest StackSupervised

  test "greets the world" do
    assert StackSupervised.hello() == :world
  end
end
