defmodule Chat.Cache do
  use GenServer
  require Logger


  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: ChatCache)
  end

  def init(state) do
    :ets.new(:chat_cache, [:set, :public, :named_table])
    {:ok, state}
  end

  def delete(key) do
    GenServer.cast(ChatCache, {:delete, key})
  end

  def get(key) do
    GenServer.call(ChatCache, {:get, key})
  end

  def put(key, data) do
    GenServer.cast(ChatCache, {:put, key, data})
  end

  #### API
  def handle_call({:get, key}, _form, state) do
    reply =
      case :ets.lookup(:chat_cache, key) do
        [] -> nil
        [{_key, chat}] -> chat
      end
    {:reply, reply, state}
  end

  def handle_cast({:delete, key}, state) do
    :ets.delete(:chat_cache, key)
    {:noreply, state}
  end

  def handle_cast({:put, key, data}, state) do
    :ets.insert(:chat_cache, {key, data})
    {:noreply, state}
  end
end
