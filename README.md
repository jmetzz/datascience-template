# Data Science project template


> *Note*: This template uses poetry and python 3.9+


This repository is a [cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a data science project.

## The necessary tools

[`poetry`](https://python-poetry.org/) dependency management
[`pre-commit`](https://pre-commit.com/) plugins to automate code quality aspects


## Usage guide 

You first need to have `cookiecutter` available in your machine. There are several alternatives to this. Here are 2:

Installation via `homebrew` (for MacOs users): `brew install cookiecutter`

```bash
brew install cookiecutter
```


Or, create a python environment with `cookiecutter` in it. Assuming you have a `workspace` directory in you `USER HOME`,
you can then add the `cookiecutter` environment into it like so:
```bash
python -m venv ~/workspace/cookiecutter
source ~/workspace/cookiecutter/bin/activate
python -m pip install -U pip cookiecutter 
```

> Reminder: if you opted for the python environment approach, you will only be able to use `cookiecutter` as 
> a command if you activate the environment.  

Now you are ready to create a new project from the template, using the `cookiecutter` utility:

```bash
cookiecutter https://github.com:onpage-org/data-science-template
```

You will be prompted to answer some details about your project.
