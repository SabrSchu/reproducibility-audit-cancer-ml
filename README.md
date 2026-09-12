# Executable Reproducibility of Machine-Learning Workflows in Cancer Research

This repository contains the reproduction artifacts for the study **“Executable Reproducibility as a Foundation of Trustworthy AI on an example: Computational Audit of Machine-Learning Workflows in Cancer Research.”**

The repository combines the reproduction materials for two machine-learning research projects. Each reproduction is maintained in a separate subdirectory and contains its own documentation describing the adaptations, environment, and execution procedure.

## Repository Structure

```text
.
├── GCATSL/
│   ├── README.md
│   └── ...
│
├── optimizers_dilemma/
│   ├── README.md
│   └── ...
│
└── README.md
```

### `GCATSL/`

Contains the reproduction of the first selected research project.

See [`GCATSL/README.md`](GCATSL/README.md) for:

* information about the original project
* reproduction-specific adaptations
* software and environment requirements
* instructions for running the experiment

### `optimizers_dilemma/`

Contains the reproduction of the second selected research project.

See [`optimizers_dilemma/README.md`](optimizers_dilemma/README.md) for the corresponding reproduction documentation.

## Original Repositories

The reproductions are based on the following original research implementations:

| Reproduction                       | Original repository       | Version / commit      |
|------------------------------------| ------------------------- | --------------------- |
| Reproduction of GCATSL             | [https://github.com/lichenbiostat/GCATSL] | `[1ad960e03a0b9bc4f0c3f35db66b5b45d53bad3b]` |
| Reproduction of optimizers_dilemma | [https://github.com/greenelab/pancancer-evaluation] | `[7650b0ff18dfa466b74937cfcac3317443d01056]` |

The original source code and documentation have been preserved as far as possible. Modifications made specifically for the reproduction are documented in the README of each respective subdirectory.

## Reproduction Environment

The experiments were adapted to run in controlled Docker environments where possible. The individual reproduction READMEs provide the exact Docker configuration, dependencies, parameters, and execution instructions for each experiment.

For details specific to each experiment, see the corresponding reproduction README.


## Purpose

This repository was created to support the evaluation of the **executable reproducibility** of machine-learning workflows in cancer research.

The reproductions document the process of taking existing research implementations and executing them in the available computational environment, including any adaptations required to make the original workflows executable.


