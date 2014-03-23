defmodule BeamToolbox.Model do
  def slug(string) do
    string
      |> String.replace(" ", "-")
  end

  defmacro __using__(_opts) do
    quote do
      def list(data) do
        Enum.map(data, &(&1.name))
      end

      def find(data, expected_name) do
        Enum.find(data, fn(data) -> data.name == expected_name end)
      end
    end
  end
end
