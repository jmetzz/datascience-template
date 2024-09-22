"""Command-line interface."""

import {{cookiecutter.project_slug}}

import logging

import typer

app = typer.Typer()


@app.command()
def main():
    """Console script for {{cookiecutter.project_name}}."""
    logging.info("""Project: {{cookiecutter.project_slug}}.""")


if __name__ == "__main__":
    app()
