use Mix.Config

config :advent_of_code, AdventOfCode.Input,
  allow_network?: true,
  session_cookie:
    "53616c7465645f5f0329634be7025eeb2ff4ba6b88b4198c9479c88218a67cdd166397c4afd9b683a6eb5ea8045b0596"

# If you don't like environment variables, put your cookie in
# a `config/secrets.exs` file like this:
#
# config :advent_of_code, AdventOfCode.Input,
#   advent_of_code_session_cookie: "session=..."

try do
  import_config "secrets.exs"
rescue
  _ -> :ok
end
