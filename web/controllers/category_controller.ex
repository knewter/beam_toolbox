defmodule BeamToolbox.CategoryController do
  use BeamToolbox.Web, :controller

  alias BeamToolbox.Category

  plug :scrub_params, "category" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    categories = Repo.all(Category)
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    changeset = Category.changeset(%Category{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    changeset = Category.changeset(%Category{}, category_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Category created successfully.")
      |> redirect(to: category_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Repo.get(Category, id)
    render(conn, "show.html", category: category)
  end

  def edit(conn, %{"id" => id}) do
    category = Repo.get(Category, id)
    changeset = Category.changeset(category)
    render(conn, "edit.html", category: category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Repo.get(Category, id)
    changeset = Category.changeset(category, category_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Category updated successfully.")
      |> redirect(to: category_path(conn, :index))
    else
      render(conn, "edit.html", category: category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Repo.get(Category, id)
    Repo.delete(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: category_path(conn, :index))
  end
end
