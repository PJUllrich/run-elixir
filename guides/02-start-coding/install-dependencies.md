# Install Dependencies

You can install dependencies from a few sources, like the Elixir package manager [Hex.pm](hex.pm), GitHub, a Git repository, or a local path. You only need to add them to the `deps/0` function in your `mix.exs` file.

Let's add the HTTP library, [Req](https://hex.pm/packages/req):

```
# In your mix.exs file.

defp deps do
  [
    # Other dependencies
    # ...
    # Add this to download a dependency from hex.pm
    {:req, "~> 0.5.6"},
    # Or fetch a dependency directly from GitHub
    {:oban, github: "sorentwo/oban"},
    # Or from a Git repo
    {:prom_ex, git: "https://github.com/akoutmos/prom_ex.git"}
    # Or from a local path (commented out because it doesn't exist)
    # {:your_lib, path: "../relative/path/to/your/lib"}
  ]
end
```

Now, run `mix deps.get` to fetch the dependencies.

Let's start our website in an interactive shell to test the library. Run this in your terminal:

```
iex -S mix phx.server
```

Now you can execute Elixir code inside your project. Run this command to fetch a dad joke from the internet:

```
iex> Req.get!("https://icanhazdadjoke.com", headers: [accept: "text/plain"]).body
"I think circles are pointless."
```

And that's it! You've successfully added and tested a library :)