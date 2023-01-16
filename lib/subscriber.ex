defmodule Subscriber do
  use Yggdrasil

  @channel [name: "pg_channel", adapter: :postgres, transformer: :json]
  # @channel [name: "my_channel", transformer: :json]

  def start_link(_) do
    Yggdrasil.start_link(__MODULE__, [@channel], name: __MODULE__)
  end

  def publish(%{} = payload) do
    Yggdrasil.publish(@channel, payload)
  end

  # def get_state do
  #   GenServer.call(__MODULE__, :get_state)
  # end

  # def reset do
  #   GenServer.cast(__MODULE__, :reset)
  # end

  @impl Yggdrasil
  def init(channels) when is_list(channels) do
    {:subscribe, channels, %{n: 0, sum: 0}}
  end

  @impl Yggdrasil
  def handle_event(_channel, %{"n" => n}, %{sum: sum} = state) do
    state = %{state | n: n, sum: sum + n}
    IO.inspect(state)
    {:ok, state}
  end

  # TODO: How to get state?
  # @impl GenServer
  # def handle_call(:get_state, _from, state), do: {:reply, state, state}

  # @impl GenServer
  # def handle_cast(:reset, _state), do: {:noreply, %{n: 0, sum: 0}}
end
