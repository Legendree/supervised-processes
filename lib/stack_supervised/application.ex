defmodule StackSupervised.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, initial_state) do
    children = [
      # Starts a worker by calling: StackSupervised.Worker.start_link(arg)
      {StackSupervised.Stash, initial_state},
      {StackSupervised.Server, nil}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: StackSupervised.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
