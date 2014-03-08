defmodule BeamToolbox.GitHub do
  use HTTPoison.Base

  def repo(repo_ident) do
    repo_ident |> repo_path |> get_body
  end

  def stargazers(repo_ident) do
    repo_ident |> stargazers_path |> get_body
  end

  def forks(repo_ident) do
    repo_ident |> forks_path |> get_body
  end

  def commits(repo_ident) do
    repo_ident |> commits_path |> get_body
  end

  def latest_commit(repo_ident) do
    repo_ident |> commits |> hd
  end

  defp get_body(path) do
    get(path).body
  end

  defp process_url(url) do
    "https://api.github.com/" <> url
  end
  defp process_response_body(body) do
    JSEX.decode! body
  end

  defp repo_path(repo_ident), do: "repos/#{repo_ident}"
  defp commits_path(repo_ident), do: repo_path(repo_ident) <> "/commits"
  defp stargazers_path(repo_ident), do: repo_path(repo_ident) <> "/stargazers"
  defp forks_path(repo_ident), do: repo_path(repo_ident) <> "/forks"
end
