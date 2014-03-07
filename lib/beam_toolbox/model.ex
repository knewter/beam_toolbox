defmodule BeamToolbox.Model do
  defmacro __using__(opts) do
    quote do
      def list(data) do
        list(data, [])
      end

      def find(data, expected_name) do
        Enum.find(data, fn(data) -> data.name == expected_name end)
      end

      defp list([data|rest], acc) do
        list(rest, [data.name|acc])
      end
      defp list([], acc) do
        Enum.reverse(acc)
      end
    end
  end
end
