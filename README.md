### Create a New Phoenix API Project
To create a new API-only Phoenix project, you can use the phx.new generator with the --no-html and --no-assets flags.

```bash
mix phx.new my_api --no-html --no-assets
```

### Install Dependency
```bash
mix deps.get
```

### Generate User With Password Field
```bash
mix phx.gen.json Accounts User users name:string email:string password:string
```
###For Handling JWT Add This in Mix.exs
```bash
defp deps do
  [
    {:joken, "~> 2.0"},
    {:bcrypt_elixir, "~> 2.0"},
  ]
end
```
# MyApi

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
