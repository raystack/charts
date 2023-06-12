# Charts
[Helm](https://github.com/helm/helm) Charts for Raystack Foundation

Charts are curated application definitions for [Helm](https://github.com/helm/helm). Use this repository to submit official Raystack Foundation helm Charts. For more information about installing and using Helm, see it's `README.md`.

## TL;DR

```bash
$ helm repo add raystack https://raystack.github.io/charts/
$ helm search repo raystack
$ helm install my-release raystack/<chart>
```

## Repository Structure

This repository contains the source for the packaged and versioned charts (released in the [Github Pages](https://raystack.github.io/charts/)).
The Charts in the `stable/` directory in the main branch match the latest packaged Chart in the [Chart Repository](https://raystack.github.io/charts/).
There may be previous versions of a Chart available in the Chart Repository.

The purpose of this repository is to provide a place for maintaining and contributing official Charts, with CI processes in place for managing the releasing of Charts into the Chart Repository.

Stable Charts meet the criteria in the technical requirements.

## Usage

Once you have installed the Helm client on your kubernetes cluster, you can deploy a Raystack Helm Chart into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a few commands, otherwise the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions on how to use the Helm client to manage packages on your Kubernetes cluster.

Helm Repo URL: `https://raystack.github.io/charts/`

```bash
# To add Raystack Helm repo
$ helm repo add raystack https://raystack.github.io/charts/

# To list all the charts in the repo
$ helm search repo raystack

# To install any searched chart
$ helm install my-release raystack/<chart>
```

## Contributing a Chart
We'd love for you to contribute a Chart that provides a useful application or service for Kubernetes. Please read our Contribution Guide for more information on how you can contribute Charts.
Note: We use the same workflow, License and Contributor License Agreement as the main Kubernetes repository.
