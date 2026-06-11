# Simple Typst Resume
This is my simple resume template written in Typst.
An example output can be found [here](./resume.pdf).

## Dependencies
This template uses [Font Awesome Free](https://fontawesome.com/download) and the [Typst fontawesome package](https://typst.app/universe/package/fontawesome/). Make sure to install the Font Awesome fonts on your system and the fontawesome package on your Typst install.

## Usage
You should first define a yaml file containing the contents of the resume. An example can be found in `./example`.

You can build the resume using the following command:

```
typst compile resume.typ example/resume.pdf --input yamlpath=example/johndoe.yaml
```

or build on source changes using:


```
typst watch resume.typ example/resume.pdf --input yamlpath=example/johndoe.yaml
```
