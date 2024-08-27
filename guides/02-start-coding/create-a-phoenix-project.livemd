# Create a Phoenix Project

A fast way to explore Elixir further is to create a website using the [Phoenix](https://www.phoenixframework.org/) framework.

## Prerequisites

* You have installed Elixir (If not, see [here](https://elixir-lang.org/install.html) for instructions)
* You have a Postgres database running (If not, see [here](https://blitzjs.com/docs/postgres) for instructions)

## Create a Website

You can create and run a new website with only a few commands:

```bash
# Install the Phoenix project generator
mix archive.install hex phx_new

# Create a new project
mix phx.new demo --install

# Navigate into the new project
cd demo

# Create the database
mix ecto.create

# And start the server
mix phx.server
```

Now, go to [localhost:4000](http://localhost:4000) and you'll see a welcome page!

## Build a ToDo App in 1 Minute

Let's add some reactive content to the project! We can build a ToDo app in under a minute. Just run the following in your terminal:

```bash
# Generate a ToDo database schema and add a UI to manage them
mix phx.gen.live ToDos ToDo todos name:string done:boolean deadline:utc_datetime
```

Then, copy and paste the live routes into your `lib/demo_web/router.ex`
```elixir
scope "/", DemoWeb do
  pipe_through :browser

  get "/", PageController, :home

  # Add these here👇
  live "/todos", ToDoLive.Index, :index
  live "/todos/new", ToDoLive.Index, :new
  live "/todos/:id/edit", ToDoLive.Index, :edit

  live "/todos/:id", ToDoLive.Show, :show
  live "/todos/:id/show/edit", ToDoLive.Show, :edit
end
```

Now, go to [localhost:4000/todos](http://localhost:4000/todos). It will ask you to run the migrations. Just click on `Run migrations for repo`.

You should now see an empty list of ToDos. Just click on `New To do` to add your first todo! Try editing and deleting some todos.

You might wonder why you don't see page reloads when you add or remove todos. That's because we use [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view), which allows us to write reactive but server-rendered frontends in pure Elixir!

Check out the [Phoenix LiveView docs](https://hexdocs.pm/phoenix_live_view/welcome.html) to learn more or watch the creator of Phoenix, Chris McCord, build a real-time Twitter clone in just 15 minutes on [YouTube](https://www.youtube.com/watch?v=MZvmYaFkNJI).