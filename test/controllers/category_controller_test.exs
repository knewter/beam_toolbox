defmodule BeamToolbox.CategoryControllerTest do
  use BeamToolbox.ConnCase

  alias BeamToolbox.Category
  @valid_params category: %{name: "some content", slug: "some content"}
  @invalid_params category: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /categories", %{conn: conn} do
    conn = get conn, category_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing categories"
  end

  test "GET /categories/new", %{conn: conn} do
    conn = get conn, category_path(conn, :new)
    assert html_response(conn, 200) =~ "New category"
  end

  test "POST /categories with valid data", %{conn: conn} do
    conn = post conn, category_path(conn, :create), @valid_params
    assert redirected_to(conn) == category_path(conn, :index)
  end

  test "POST /categories with invalid data", %{conn: conn} do
    conn = post conn, category_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New category"
  end

  test "GET /categories/:id", %{conn: conn} do
    category = Repo.insert %Category{}
    conn = get conn, category_path(conn, :show, category)
    assert html_response(conn, 200) =~ "Show category"
  end

  test "GET /categories/:id/edit", %{conn: conn} do
    category = Repo.insert %Category{}
    conn = get conn, category_path(conn, :edit, category)
    assert html_response(conn, 200) =~ "Edit category"
  end

  test "PUT /categories/:id with valid data", %{conn: conn} do
    category = Repo.insert %Category{}
    conn = put conn, category_path(conn, :update, category), @valid_params
    assert redirected_to(conn) == category_path(conn, :index)
  end

  test "PUT /categories/:id with invalid data", %{conn: conn} do
    category = Repo.insert %Category{}
    conn = put conn, category_path(conn, :update, category), @invalid_params
    assert html_response(conn, 200) =~ "Edit category"
  end

  test "DELETE /categories/:id", %{conn: conn} do
    category = Repo.insert %Category{}
    conn = delete conn, category_path(conn, :delete, category)
    assert redirected_to(conn) == category_path(conn, :index)
    refute Repo.get(Category, category.id)
  end
end
