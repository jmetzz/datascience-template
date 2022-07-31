"""Command-line interface."""
import typer

app = typer.Typer()


@app.command()
def main():
    """{{cookiecutter.friendly_name}}."""
    print("""Project: {{cookiecutter.project_slug}}.""")


if __name__ == "__main__":
    app()
