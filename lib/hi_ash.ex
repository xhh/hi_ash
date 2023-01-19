defmodule HiAsh do
  @moduledoc """
  HiAsh keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  use TypeCheck

  @spec! hello(String.t()) :: :ok
  def hello(name) do
    IO.puts("Hello #{name}!")
    # :err
    :ok
  end
end
