defmodule StackSupervised.Server do
  use GenServer, restart: :permanent

  alias StackSupervised.Stash

  # Interface implementation

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def pop do
    GenServer.cast(__MODULE__, :pop)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def push(item) do
    GenServer.call(__MODULE__, {:push, item})
  end

  # Process implementation

  def init(:no_args) do
    {:ok, Stash.get()}
  end

  def handle_cast(:pop, [_head | tail]) do
    {:noreply, tail}
  end

  def handle_call({:push, item}, _from, state) do
    {:reply, "Added item #{inspect(item)}", [item | state]}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def terminate(_reason, current_state) do
    Stash.update(current_state)
  end
end
