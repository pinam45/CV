# What is this

This is a repository that contains my up-to-date CV in LaTeX. There is two versions, PDF and HTML, the HTML version is used on my website [maxime.pinard.info](http://maxime.pinard.info/CV.php)


# How to build

## PDF version

### Requirements

[FontAwesome](http://fontawesome.io/) installed on your system.

### Build

Use xelatex with the following command:

``xelatex MPinard_CV.tex``

Actually not working on Linux, online version is built with Windows and Miktex

## HTML version

The HTML version is generated from the PDF version, using [pdf2htmlex](https://github.com/coolwanglu/pdf2htmlEX) with the following command:

``pdf2htmlEX --process-outline 0 --zoom 1.3 MPinard_CV.pdf``
