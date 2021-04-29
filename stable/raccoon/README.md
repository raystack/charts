# Raccoon

A [helm](https://helm.sh/) chart for [Raccoon](https://github.com/odpf/raccoon)

## Introduction

This chart can be used for deploying [Raccoon](https://github.com/odpf/raccoon) on Kubernetes using helm

## Prerequisites

Install [helm3](https://helm.sh/docs/intro/install/#helm)

## Installing the Chart

### Install released version using Helm repository

* Add the odpf charts repo
  
```bash
$ helm repo add odpf https://odpf.github.io/charts/
```

* Install it with Helm 3
  
```bash
$ helm install my-release odpf/raccoon
```

### Install development version using master branch

```bash
$ helm install --name my-release .
```

The command deploys Raccoon on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Usage notes

* Update flags for telegraf container in order to use them, defaults are set to false
* Sample Raccoon` configs are mentioned in values.yaml file, update them according to usecase, [read more](https://github.com/odpf/raccoon/blob/main/docs/reference/configuration.md#configurations)
* Set the resource limits of containers according to the usage

## Configuration

The following table lists the configurable parameters of Firehose chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| raccoon.config | object | `{"SERVER_WEBSOCKET_PORT": "8080", "SERVER_WEBSOCKET_CONN_UNIQ_ID_HEADER": "x-user-id", "PUBLISHER_KAFKA_CLIENT_BOOTSTRAP_SERVERS": "host.docker.internal:9094", "METRIC_STATSD_ADDRESS": "host.docker.internal:8125"}` | env variables required by raccoon, [read more](https://odpf.gitbook.io/raccoon/reference/configurations) |
| raccoon.image.pullPolicy | string | `"IfNotPresent"` | the Kubernetes [imagePullPolicy](https://kubernetes.io/docs/concepts/containers/images/#updating-images) value for raccoon container |
| raccoon.image.repository | string | `"odpf/raccoon"` | docker repository to download raccoon image |
| raccoon.image.tag | string | `"0.1.0"` | raccoon docker image tag |
| raccoon.resources.limits.cpu | string | `"200m"` | raccoon container cpu limit |
| raccoon.resources.limits.memory | string | `"512Mi"` | raccoon container memory limit |
| raccoon.resources.requests.cpu | string | `"200m"` | raccoon container cpu requests |
| raccoon.resources.requests.memory | string | `"512Mi"` | raccoon container memory requests |
| fullnameOverride | string | `""` | overrides the fullname when used in the naming of resources |
| labels | object | `{"application":"raccoon"}` | labels for all resouces |
| nameOverride | string | `""` | overrides the chart name when used in the naming of resources |
| replicaCount | int | `1` | number of replicas of raccoon pod |
| telegraf.config.output.influxdb.database | string | `"test-db"` | db name for telegraf influxdb output |
| telegraf.config.output.influxdb.enabled | bool | `false` | flag for enabling telegraf influxdb output |
| telegraf.config.output.influxdb.retention_policy | string | `"autogen"` | retention policy for telegraf influxdb output |
| telegraf.config.output.influxdb.urls | list | `["http://localhost:8086"]` | influxdb urls for telegraf output |
| telegraf.enabled | bool | `false` | flag for enabling telegraf |
| telegraf.image.pullPolicy | string | `"IfNotPresent"` | the Kubernetes [imagePullPolicy](https://kubernetes.io/docs/concepts/containers/images/#updating-images) value for telegraf container |
| telegraf.image.repository | string | `"telegraf"` | docker repository to download telegraf image |
| telegraf.image.tag | string | `"1.7.4-alpine"` | telegraf docker image tag |
| telegraf.resources.limits.cpu | string | `"50m"` | telegraf container cpu limit |
| telegraf.resources.limits.memory | string | `"64Mi"` | telegraf container memory limit |
| telegraf.resources.requests.cpu | string | `"50m"` | telegraf container cpu requests |
| telegraf.resources.requests.memory | string | `"64Mi"` | telegraf container memory requests |
---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml odpf/raccoon
```

> **Tip**: You can use the default [values.yaml](values.yaml)
