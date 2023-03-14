# Dex

A [helm](https://helm.sh/) chart for [Dex](https://github.com/goto/dex)

## Introduction

This chart can be used for deploying [Dex](https://github.com/goto/dex) on Kubernetes using helm.

## Prerequisites

Install [helm3](https://helm.sh/docs/intro/install/#helm)

## Installing the Chart

### Install released version using Helm repository

- Add the gotocompany charts repo

```bash
$ helm repo add gotocompany https://goto.github.io/charts/
```

- Install it with Helm 3

```bash
$ helm install my-release gotocompany/dex
```

### Install development version using master branch

```bash
$ helm install --name my-release .
```

The command deploys Dex on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Usage notes

- Sample Dex configs are mentioned in values.yaml file, update them according to usecase, [read more](https://github.com/goto/dex/blob/main/dex.yaml)
- Set the resource limits of containers according to the usage

## Configuration

The following table lists the configurable parameters of Dex chart and their default values.

## Values

| Key                                   | Type   | Default     | Description                        |
| ------------------------------------- | ------ | ----------- | ---------------------------------- |
| app.config.SERVICE_HOST               | string | `localhost` | service host                       |
| app.config.SERVICE_PORT               | string | `3000`      | service port                       |
| app.config.LOG_LEVEL                  | string | `info`      | log level                          |
| app.config.NEW_RELIC_ENABLED          | string | `false`     | enable newrelic                    |
| app.config.TELEMETRY_SERVICE_NAME     | string | `dex`       | telemetry service name             |
| app.config.TELEMETRY_ENABLE_NEWRELIC  | bool   | `false`     | enable newrelic telemetry exporter |
| app.config.TELEMETRY_NEWRELIC_API_KEY | string |             | newrelic api key                   |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml gotocompany/dex
```

> **Tip**: You can use the default [values.yaml](values.yaml)
