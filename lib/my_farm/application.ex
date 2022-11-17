defmodule MyFarm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MyFarm.Repo,
      # Start the Telemetry supervisor
      MyFarmWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyFarm.PubSub},
      # Start the Endpoint (http/https)
      MyFarmWeb.Endpoint
      # Start a worker by calling: MyFarm.Worker.start_link(arg)
      # {MyFarm.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyFarm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyFarmWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
