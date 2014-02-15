defmodule BeamToolbox.Model do
  defmacro __using__(opts) do
    tag = Keyword.fetch(opts, :tag)
    quote do
      def list(data) do
        list(data, [])
      end

      def find(data, expected_name) do
        Enum.find(data, fn({tag, name, _children}) -> name == expected_name end)
      end

      defp list([{tag, title, _children}|rest], acc) do
        list(rest, [title|acc])
      end
      defp list([], acc) do
        Enum.reverse(acc)
      end
    end
  end
end
