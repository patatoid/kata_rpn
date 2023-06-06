defmodule Rpn do
  def compute(input) do
    with nil <- Regex.run(~r/^-?\d+$/, input),
      [_all, operation, a, b, operator, _end] <- Regex.run(~r/((-?\d+) (-?\d+) (\-|\+|\*|\/))([^\d]|$)/, input),
      {res, _bindings} <- Code.eval_string("#{a} #{operator} #{b}") do
      input
      |> String.replace(operation, to_string(round(res)))
      |> compute()
    else
      [result] ->
        {:ok, String.to_integer(result)}
      _ ->
        {:error, "Invalid input."}
    end
  end
end
