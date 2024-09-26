"""Test cases for the __main__ module."""

import logging

from typer.testing import CliRunner

from cli import app

runner = CliRunner()


def test_app(caplog):
    # Test that the app runs successfully
    with caplog.at_level(logging.INFO):  # Capture logs at INFO level
        result = runner.invoke(app)

        # Check that the command exited successfully (exit code 0)
        assert result.exit_code == 0

        # Check that the log contains the expected output
        assert f"Project: {{cookiecutter.__module_slug}}" in caplog.text
