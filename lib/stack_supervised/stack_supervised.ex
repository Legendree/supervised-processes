defmodule StackSupervised do
  use Application

  def start(_type, _args) do
    StackSupervised.Server.start_link(Application.get_env(:stack_supervised, :initial_state))
  end
end
