# Web APIs with mORMot
This repository houses example projects to accompany my article [Web APIs with mORMot](https://stephan-bester.medium.com/web-apis-with-mormot-891c0ecd3950), though you might find [The ORM in mORMot](https://stephan-bester.medium.com/the-orm-in-mormot-3a11c8ac0c35) a useful supplementary read.

## Requirements

These projects depend on the [mORMot framework](https://synopse.info/fossil/wiki?name=SQLite3+Framework), which they expect to find on your search path. See [Getting started with mORMot and Delphi](https://stephan-bester.medium.com/getting-started-with-mormot-and-delphi-3fdb38eee1f2) for help setting things up. I created the project files using Delphi 10.3.1 Starter but the code in the .pas files should be compatible with just about any version of Delphi.

## Directory structure

### 01 REST ORM
The project in this directory demonstrates *Option #1: The REST ORM* from my article.

### 02 Methods-based services
This project extends the first project to demonstrate *Option #2: Publishing a methods-based service*.

### 03 Interface-based services
This project further builds on the second project to demonstrate *Option #3: Publishing an interface-based service*.

### Common
This directory contains units that are common to the three sample projects.