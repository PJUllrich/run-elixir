defmodule Watcher do
  use GenServer

  require Logger

  def start_link(args) do
    path = Path.absname("./doc/welcome.html")
    Logger.info("I'm listening. Access the docs at: file:///#{path}")

    GenServer.start_link(__MODULE__, args)
  end

  def init(_args) do
    {:ok, watcher_pid} = FileSystem.start_link(dirs: ["./guides", "./assets", "./mix.exs"])
    FileSystem.subscribe(watcher_pid)
    {:ok, %{watcher_pid: watcher_pid}}
  end

  def handle_info({:file_event, _watcher_pid, {path, _events}}, state) do
    Logger.info("File changed: #{path}")
    System.cmd("mix", ["docs"])
    {:noreply, state}
  end
end

{:ok, _pid} = Watcher.start_link([])
Process.sleep(:infinity)
