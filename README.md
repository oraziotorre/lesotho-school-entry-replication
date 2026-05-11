# Replication Project

## Overview

This repository replicates the results from the paper:

> De Neve, J.-W., Moshoeshoe, R., & Bor, J. (2026).  
> *Age at School Entry and Human Capital Development: Evidence from Lesotho.*  
> American Economic Journal: Applied Economics.

The paper studies how the age at which children start primary school affects education, labor market outcomes, health, and demographic outcomes in Lesotho, using a regression discontinuity design based on a school entry cutoff.

The goal of this project is to reproduce the main empirical results, figures, and tables using Julia.

---

## Project Structure

```
lesotho-school-entry-replication/
│
├── images/
│
├── replication-package/
│   ├── LesothoSchoolEntryReplication.jl/
│   │   ├── Project.toml
│   │   ├── Manifest.toml
│   │   │
│   │   ├── src/
│   │   │   ├── LesothoSchoolEntryReplication.jl
│   │   │   ├── run_all.jl
│   │   │   ├── figures.jl
│   │   │   ├── tables.jl
│   │   │   └── utils.jl
│   │   │
│   │   ├── test/
│   │   │   └── runtests.jl
│   │   │
│   │   └── output/
│   │       ├── figures/
│   │       └── tables/
│   │
│   └── original-replication/
│
├── report_files/
├── report.qmd
├── report.html
│
├── .gitignore
└── README.md
```

---

## Installation

1. Install Julia (recommended version: **1.12.6**) from https://julialang.org/downloads/ and verify:

```bash
julia --version
```

2. Clone the repository and run Julia:
```bash
git clone https://github.com/oraziotorre/lesotho-school-entry-replication.git
cd lesotho-school-entry-replication
julia
```

## Running the Replication:

1. Activate the environment:
```julia
using Pkg
Pkg.activate("./replication-package/LesothoSchoolEntryReplication.jl")
```

2. Install the dependencies:
```julia
Pkg.instantiate()
```

3. Run the full replication:
```julia
using LesothoSchoolEntryReplication
run_all()
```

All replicated results are saved in:

```
replication-package/LesothoSchoolEntryReplication.jl/output/
```

Ensure that all required datasets are correctly placed in the `replication-package/original-replication/Raw_data/` folder.
If the data are missing or incomplete, you must first run the original replication using the Stata master script located at:
`replication-package/original-replication/Dofiles/_masterscript.do`

---

## Running Unit Tests

To run the unit tests:

```julia
using Pkg
Pkg.activate("./replication-package/LesothoSchoolEntryReplication.jl")
Pkg.test()
```

---

## Report

The replication report is written using Quarto.

### Compile the report

1. Navigate to:
```
report/
```

2. Run:
```bash
quarto render
```

The compiled report will be available as:
- `.html` or `.pdf` in the main folder

---

## Authors

- Orazio Torre — Collegio Carlo Alberto & Politecnico di Torino  
- Dalila Maria Tamburrano — Collegio Carlo Alberto & Politecnico di Torino  
- Dalia Lemmi — Collegio Carlo Alberto & Politecnico di Torino  

---

# CompEcon Project Template 

This is the replication project template. 

## Step Number 1

* Click top right on `use this template`, then `create a new repository`.
* Choose a suitable name for your replication project.
* Clone your new repository to your computer.
* Open this locally in VScode.

(you get a nice preview of this document in VScode by executing command `Markdown: Open preview` - type this into the command 😉 )

This page should contain concise information for how to

1. install your julia package
2. run the unit tests
3. run the replication output (there needs to be a single entry point that runs everything, ideally called `run_all()`)
4. gives instructions for how to compile and where to see your replication [report](report.qmd). See [https://quarto.org](https://quarto.org) for instructions for how to use quarto.

## First steps

1. Copy the original replication package into the folder `replication-package`
2. (optional) follow instructions in `replication-package` to replicate desired exhibits
3. set up your julia package in this repo. To do so, start the julia REPL in this location (alt-J alt-O, otherwise look in command palette)
4. Choose a name for your replication package, for example `XYZ.jl` (choose something better and replace `XYZ` throughout with your choice!)
5. Generate your julia package in this directory with
   
    ```julia
    using Pkg
    Pkg.generate("XYZ.jl")
    ```
6. In the VScode file browser on the left, investigate the newly created directory
7. Activate your package:
   
    ```julia
    julia> Pkg.activate("XYZ.jl")

    # load it
    julia> using XYZ

    # run function
    julia> XYZ.greet()
    Hello World!
    ```
8. Edit the code in `XYZ.jl/src/XYZ.jl`, maybe adding a word to the greet function. Save the file. Call the function again.
   
    ```julia
    julia> XYZ.greet()
    Hello World, Earthlings!
    ```


