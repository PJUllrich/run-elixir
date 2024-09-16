defmodule Demo.FileLogger do
  @moduledoc """
  A simple Logger backend that logs to a file.
  DON'T USE THIS IN PRODUCTION, BUT USE THE BUILT-IN FILE LOGGER INSTEAD!
  """

  @default_path "./out.log"
  @default_level :debug
  @default_format "$date $time [$level] $message\n"

  def convert_format(format) do
    Regex.split(~r/(\$\w+)/, format, include_captures: true)
    |> Enum.map(fn
      "$" <> "message" -> :msg
      "$" <> "time" -> :time_short
      "$" <> word -> String.to_existing_atom(word)
      "" -> nil
      other -> other
    end)
    |> Enum.reject(&is_nil/1)
  end

  def adding_handler(config) do
    # Merge the config with the default options
    opts = Map.get(config, :config, %{})
    default_opts = %{path: @default_path, level: @default_level, format: @default_format}
    opts = Map.merge(default_opts, opts)

    opts = Map.put(opts, :format, convert_format(opts.format))

    # Open the file for writing
    opts = Map.put(opts, :path, Path.expand(opts.path))

    config = Map.put(config, :config, opts)
    {:ok, config}
  end

  def log(event, %{config: opts} = _config) do
    IO.inspect(event, label: "Event")
    IO.inspect(opts, label: "Config")

    if :logger.compare_levels(event.level, opts.level) != :lt do
      {{year, month, day}, {hour, minute, second}} =
        :calendar.system_time_to_universal_time(event.meta.time, :microsecond)

      date = ~c"#{year}-#{month}-#{day}"
      time_short = ~c"#{hour}:#{minute}:#{second}"
      event = %{event | meta: Map.merge(event.meta, %{date: date, time_short: time_short})}

      line =
        :logger_formatter.format(event, %{template: opts.format}) |> Enum.join()

      File.write!(opts.path, line, [:append, :utf8])
    end

    :ok
  end
end
