"""Command-line interface."""

from {{cookiecutter.__module_slug}} import hello

import logging

import typer

app = typer.Typer()


@app.command()
def main():
    """Console script for '"{{ cookiecutter.project_slug | title }}"'."""
    logging.info("""Project: {{cookiecutter.__module_slug}}.""")
    print(hello())


if __name__ == "__main__":
    app()
