import re
import sys


def validate_module_slug(module_slug):
    regex = r"^[_a-zA-Z][_a-zA-Z0-9]+$"
    if not re.match(regex, module_slug):
        print(  # noqa: T201
            f"ERROR: The project slug ({module_slug}) is not a valid Python module name. "
            "Please do not use a - and use _ instead"
        )
        sys.exit(1)


def validate_project_slug(project_slug):
    regex = r"^[a-zA-Z][-a-zA-Z0-9]+$"
    if not re.match(regex, project_slug):
        print(f"Invalid project_slug '{project_slug}'. It must match the regex: {regex}")
        sys.exit(1)


def main():
    validate_project_slug("{{ cookiecutter.project_slug }}")
    validate_module_slug("{{cookiecutter.__module_slug}}")


if __name__ == "__main__":
    main()
