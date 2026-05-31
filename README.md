# Simple Typst Resume
This is my simple resume template written in Typst.

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
