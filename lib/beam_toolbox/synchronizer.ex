defmodule BeamToolbox.Synchronizer do
  @hour 1000 * 60 * 60

  def start_link() do
    pid = spawn_link(__MODULE__, :run_constantly, [])
    {:ok, pid}
  end

  def run_constantly do
    run
    :timer.sleep @hour
    run_constantly
  end

  def run do
    IO.puts "Synchronizing packages..."
    HexClient.packages |> BeamToolbox.HexSynchronizer.synchronize
    IO.puts "Done synchronizing packages..."
  end
end
