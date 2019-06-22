# CV

| Version | Build status | PDF   | HTML  |
| :-----: | :----------: | :---: | :---: |
| FR      | [![build status](https://travis-ci.org/pinam45/CV.svg?branch=master)](https://travis-ci.org/pinam45/CV) | [![download](https://img.shields.io/badge/pdf-download-informational.svg)](https://static.pinard.info/CV/MPinard_CV_FR.pdf) | [![view](https://img.shields.io/badge/html-view-informational.svg)](https://static.pinard.info/CV/MPinard_CV_FR.html) |
| FR_QC   | [![build status](https://travis-ci.org/pinam45/CV.svg?branch=master)](https://travis-ci.org/pinam45/CV) | [![download](https://img.shields.io/badge/pdf-download-informational.svg)](https://static.pinard.info/CV/MPinard_CV_FR_QC.pdf) | [![view](https://img.shields.io/badge/html-view-informational.svg)](https://static.pinard.info/CV/MPinard_CV_FR_QC.html) |
| EN_US   | [![build status](https://travis-ci.org/pinam45/CV.svg?branch=master)](https://travis-ci.org/pinam45/CV) | [![download](https://img.shields.io/badge/pdf-download-informational.svg)](https://static.pinard.info/CV/MPinard_CV_EN_US.pdf) | [![view](https://img.shields.io/badge/html-view-informational.svg)](https://static.pinard.info/CV/MPinard_CV_EN_US.html) |

## About

This repository contains the LaTeX sources of the 3 versions of my CV:
- **FR**: French version for France
- **FR_QC**: French version for Quebec
- **EN_US**: English version the United States

Each versions can be compiled in PDF and HTML and are accessible from my website [maxime.pinard.info](http://maxime.pinard.info/CV).

## How to build

### Requirements

- A LaTeX distribution such as [TeX Live](http://tug.org/texlive)
- [FontAwesome](http://fontawesome.io/) installed on your system
- [LuaTeX](http://www.luatex.org/) (default in the Makefile) or XeTeX to generate the PDFs
- [pdf2htmlex](https://github.com/coolwanglu/pdf2htmlEX) to generate the HTMLs from the PDFs

### Build

To build PDFs and HTMLs using the *Makefile*:

```
$ make
```

Only the PDFs:

```
$ make pdf
```
