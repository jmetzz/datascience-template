from datetime import datetime
from pathlib import Path


def test_cookiecutter_bake(cookies):
    result: Path = cookies.bake(
        extra_context={
            "project_slug": "my-project",
            "author": "John Doe",
            "github_username": "john_doe",
            "license": "MIT",
        }
    )
    # Check if the result was successful
    assert result.exit_code == 0
    assert result.exception is None

    project_path = result.project_path
    assert project_path.is_dir()
    assert project_path.name == "my-project"

    # validates the license generation
    license_file_path = result.project_path / "LICENSE"
    curr_year = str(datetime.now().year)
    assert license_file_path.is_file()
    with license_file_path.open("r") as f:
        content = f.read()
        assert f"Copyright (c) {curr_year}, John Doe" in content

    # Validate the project basic structure
    assert project_path.joinpath("src").is_dir()

    assert project_path.joinpath("src/my_project.py").is_file()
    assert project_path.joinpath("src/cli.py").is_file()

    assert project_path.joinpath("tests").is_dir()
    assert project_path.joinpath("tests/test_cli.py").is_file()

    assert project_path.joinpath(".gitignore").is_file()
    assert project_path.joinpath(".pre-commit-config.yaml").is_file()
    assert project_path.joinpath("Makefile").is_file()
    assert project_path.joinpath("pyproject.toml").is_file()
