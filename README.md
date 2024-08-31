# RunElixir - A Quickstart Guide to Elixir

This project intends to give a 30min quickstart to the [Elixir](elixir-lang.org) programming language.

You can find the latest version at [RunElixir.com](https://runelixir.com)

## Contribute

You're more than welcome to propose new chapters for the guide or to extend/correct/shorten existing ones. Just clone the repo and create a pull request.

## Setup locally

First, run `mix deps.get` to get the dependencies.

I wrote a little file-watcher to make it easy to see your latest changes. Just run it with:

```bash
mix run watch.exs
```

It will re-run `mix docs` every time you change a file in `./guides` or the `mix.exs` file, where we configure [ExDoc](https://hexdocs.pm/ex_doc/readme.html).

The script will print out a link to the docs which you can open in your browser to see your changes.