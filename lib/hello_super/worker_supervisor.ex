defmodule HelloSuper.WorkerSupervisor do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(init_state) do
    IO.puts("WorkerSupervisor ::init ---")
    IO.inspect(init_state)

      children = [
        %{id: HelloSuper.Worker, start: {HelloSuper.Worker, :start_link, []}}
      ]


    Supervisor.init(children, strategy: :simple_one_for_one)
  end

  def start_child(state) do
    Supervisor.start_child(__MODULE__, [state])
  end

  def stop_child(child) do
    Supervisor.terminate_child(__MODULE__, child)
  end
end
