defmodule BeamToolbox.Model do
  defmacro __using__(opts) do
    tag = Keyword.fetch(opts, :tag)
    quote do
      def list(data) do
        list(data, [])
      end

      def find(data, expected_name) do
        Enum.find(data, fn(data) -> name(data) == expected_name end)
      end

      defp list([data|rest], acc) do
        list(rest, [name(data)|acc])
      end
      defp list([], acc) do
        Enum.reverse(acc)
      end

      ### Required overridden functions
      def name(data) do
        throw "You must implement the `name/1` function in order to use BeamToolbox.Model correctly."
      end

      defoverridable [name: 1]
    end
  end
end
