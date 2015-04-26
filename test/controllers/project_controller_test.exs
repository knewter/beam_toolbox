defmodule BeamToolbox.ProjectControllerTest do
  use BeamToolbox.ConnCase

  alias BeamToolbox.Project
  @valid_params project: %{category_id: 42, details: "some content", key: "some content"}
  @invalid_params project: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /projects", %{conn: conn} do
    conn = get conn, project_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing projects"
  end

  test "GET /projects/new", %{conn: conn} do
    conn = get conn, project_path(conn, :new)
    assert html_response(conn, 200) =~ "New project"
  end

  test "POST /projects with valid data", %{conn: conn} do
    conn = post conn, project_path(conn, :create), @valid_params
    assert redirected_to(conn) == project_path(conn, :index)
  end

  test "POST /projects with invalid data", %{conn: conn} do
    conn = post conn, project_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New project"
  end

  test "GET /projects/:id", %{conn: conn} do
    project = Repo.insert %Project{}
    conn = get conn, project_path(conn, :show, project)
    assert html_response(conn, 200) =~ "Show project"
  end

  test "GET /projects/:id/edit", %{conn: conn} do
    project = Repo.insert %Project{}
    conn = get conn, project_path(conn, :edit, project)
    assert html_response(conn, 200) =~ "Edit project"
  end

  test "PUT /projects/:id with valid data", %{conn: conn} do
    project = Repo.insert %Project{}
    conn = put conn, project_path(conn, :update, project), @valid_params
    assert redirected_to(conn) == project_path(conn, :index)
  end

  test "PUT /projects/:id with invalid data", %{conn: conn} do
    project = Repo.insert %Project{}
    conn = put conn, project_path(conn, :update, project), @invalid_params
    assert html_response(conn, 200) =~ "Edit project"
  end

  test "DELETE /projects/:id", %{conn: conn} do
    project = Repo.insert %Project{}
    conn = delete conn, project_path(conn, :delete, project)
    assert redirected_to(conn) == project_path(conn, :index)
    refute Repo.get(Project, project.id)
  end
end
