defmodule ChatWeb.PopsicalKaraokeChannel do
  use ChatWeb, :channel

  alias Chat.Chats

  @impl true
  def join("popsical_karaoke:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (popsical_karaoke:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
