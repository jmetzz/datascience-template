"""Test cases for the __main__ module."""
from typer.testing import CliRunner

from {{cookiecutter.package_name}} import cli

runner = CliRunner()


def test_app():
    result = runner.invoke(cli.app)
    assert result.exit_code == 0
    assert "Project: " in result.stdout
