# 📄 Master's Thesis - 3D Graphics Engine Implementation on Apple Hardware

This repository contains the source code and documentation for my master's thesis titled:
"Projekt i implementacja silnika grafiki trójwymiarowej w środowisku sprzętowym Apple"

The thesis was completed in 2023 at the Institute of Computer Science and Mathematics, Kraków.
The supervisor was Dr. Henryk Telega.

## Overview 🧠

This project focuses on implementing a 3D graphics engine specifically designed for Apple hardware environments. The thesis explores the design, implementation, and performance characteristics of such an engine. It begins with an introduction to 3D graphics concepts including graphics pipelines, coordinate systems, and graphics libraries. The core implementation details cover technologies used, system structure, architecture, scene management, rendering components, and performance considerations.

The engine is built to leverage Apple's hardware capabilities, particularly utilizing Metal API for optimal performance on macOS and iOS platforms. It demonstrates practical application of 3D graphics concepts in a real-world scenario.

## Repository Structure 📁

- `master-s-thesis.tex` - Main LaTeX document for the thesis
- `build.sh` - Build script to generate the PDF
- `thesis-blueprint.cls` - Custom LaTeX class for the thesis format
- `title.txt` - Contains the title in a normalized form
- `chapters/` - Directory containing individual chapters of the thesis
- `code/` - Source code examples and implementations
- `diagrams/` - Diagrams used in the thesis
- `extensions/` - LaTeX extensions and custom macros
- `images/` - Images referenced in the thesis

The repository is organized to separate the LaTeX document structure from the content. The `chapters/` directory contains all individual chapters of the thesis, while `code/`, `diagrams/`, and `images/` store supplementary materials.

## Building the Thesis 🖨️

To build the thesis PDF, run:

```bash
./build.sh
```

This will generate a PDF file in the `distribution` directory with the current date and time in its filename.

The build script automates the LaTeX compilation process and handles all necessary dependencies to produce a properly formatted thesis document.

## Thesis Content 📚

The thesis covers:

1. Introduction to 3D graphics concepts including graphics pipelines, coordinate systems, and graphics libraries
2. Available solutions in the market
3. Detailed implementation of the engine covering technologies used, system structure, architecture, scene management, rendering components, and performance considerations
4. Performance analysis and presentation
5. Conclusion and future work

The content explores both theoretical foundations and practical implementation details, demonstrating how modern graphics engines can be built specifically for Apple's hardware ecosystem.

## Requirements 🛠️

To build this thesis, you need:
- LaTeX distribution (e.g., TeX Live or MacTeX)
- pdflatex
