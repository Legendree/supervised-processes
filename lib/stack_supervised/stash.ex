defmodule StackSupervised.Stash do
  use GenServer, restart: :permanent

  @me StackSupervised.Stash

  def start_link(state) do
    GenServer.start_link(@me, state, name: @me)
  end

  def get do
    GenServer.call(@me, :get)
  end

  def update(state) do
    GenServer.cast(@me, {:update, state})
  end

  # Process implementation

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_call(:get, _from, current_state) do
    {:reply, current_state, current_state}
  end

  def handle_cast({:update, state}, _current_state) do
    {:noreply, state}
  end
end
