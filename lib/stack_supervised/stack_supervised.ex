defmodule StackSupervised do
  use Application

  def start(_type, _args) do
    children = [
      {StackSupervised.Stash, Application.get_env(:stack_supervised, :initial_state)},
      {StackSupervised.Server, nil}
    ]

    config = [
      strategy: :rest_for_one,
      name: StackSupervised.Supervisor
    ]

    Supervisor.start_link(children, config)
  end
end
