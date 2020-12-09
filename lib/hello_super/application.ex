defmodule HelloSuper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      HelloSuper.WorkerSupervisor, # uses child_spec/1
      HelloSuper.MyServer # uses child_spec/1
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloSuper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
 
