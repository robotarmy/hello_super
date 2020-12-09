defmodule HelloSuper.Worker do
  use Agent

  def start_link(state) do
    IO.puts("Worker Init :: #{inspect(state)}")
    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def stop_supervisor do
    Supervisor.stop(HelloSuper.WorkerSupervisor, :broker_dance_starting)
  end
end
