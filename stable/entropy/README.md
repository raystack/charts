# Entropy

A [helm](https://helm.sh/) chart for [Entropy](https://github.com/goto/entropy)

## Introduction

This chart can be used for deploying [Entropy](https://github.com/goto/entropy) on Kubernetes using helm.

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
$ helm install my-release gotocompany/entropy
```

### Install development version using master branch

```bash
$ helm install --name my-release .
```

The command deploys Entropy on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Usage notes

- Sample Entropy configs are mentioned in values.yaml file, update them according to usecase, [read more](https://github.com/goto/entropy/blob/main/docs/reference/configuration.md#configurations)
- Set the resource limits of containers according to the usage

## Configuration

The following table lists the configurable parameters of Entropy chart and their default values.

## Values

| Key                             | Type     | Default                                                      | Description                        |
| ------------------------------- | -------- | ------------------------------------------------------------ | ---------------------------------- |
| app.config.SERVICE_HOST         | string   | `localhost`                                                  | service host                       |
| app.config.SERVICE_PORT         | string   | `3000`                                                       | service port                       |
| app.config.LOG_LEVEL            | string   | `info`                                                       | log level                          |
| app.config.PG_CONN_STR          | string   | `postgres://postgres@localhost:5432/entropy?sslmode=disable` | Postgres connection string         |
| app.config.NEW_RELIC_ENABLED    | string   | `false`                                                      | enable newrelic                    |
| app.config.NEW_RELIC_APP_NAME   | string   | `entropy`                                                    | newrelic app name                  |
| app.config.WORKER_QUEUE_NAME    | string   | `entropy_jobs`                                               | Job queue name                     |
| app.config.WORKER_QUEUE_SPEC    | string   | `postgres://postgres@localhost:5432/entropy?sslmode=disable` | Job queue specification            |
| app.config.WORKER_THREADS       | integer  | `1`                                                          | Number of worker threads to run    |
| app.config.WORKER_POLL_INTERVAL | duration | `100ms`                                                      | Interval between each poll for job |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml gotocompany/entropy
```

> **Tip**: You can use the default [values.yaml](values.yaml)
