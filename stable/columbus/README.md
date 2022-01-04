# Columbus

A [helm](https://helm.sh/) chart for [Columbus](https://github.com/odpf/columbus)

## Introduction

This chart can be used for deploying [Columbus](https://github.com/odpf/columbus) on Kubernetes using helm

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
$ helm install my-release odpf/columbus
```

### Install development version using master branch

```bash
$ helm install --name my-release .
```

The command deploys Columbus on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Usage notes

* Use init-columbus container in order to download and load proto jar files for Filter functionality
* Update flags for init-columbus and telegraf containers in order to use them, defaults are set to false
* Jolokia input for telegraf will be enabled only if jolokia is mentioned in JAVA_TOOL_OPTIONS in columbus config
* Sample Columbus configs are mentioned in values.yaml file, update them according to usecase, [read more](https://github.com/odpf/columbus/blob/main/docs/reference/configuration.md#configurations)
* Set the resource limits of containers according to the usage

## Configuration

The following table lists the configurable parameters of Columbus chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.config.SERVER_HOST | string | `localhost` | service host |
| app.config.SERVER_PORT | string | `3000` | service port |
| app.config.STATSD_ENABLED | string | `false` | enable statsd |
| app.config.STATSD_PREFIX | string | `columbus` | statsd prefix |
| app.config.LINEAGE_REFRESH_INTERVAL | string | `30m` | refresh interval for lineage building |
| app.config.NEW_RELIC_ENABLED | string | `false` | enable newrelic |
| app.config.NEW_RELIC_APP_NAME | string | `columbus` | newrelic app name |
| app.config.LOG_LEVEL | string | `info` | log level |
| app.secretConfig.ELASTICSEARCH_BROKERS | string | `` | elasticsearch brokers |
| app.secretConfig.STATSD_ADDRESS | string | `` | statsd address |
| app.secretConfig.NEW_RELIC_LICENSE_KEY | string | `` | newrelic license key |
| app.secretConfig.DB_HOST | string | `` | database host |
| app.secretConfig.DB_PORT | number | 5432 | database port |
| app.secretConfig.DB_NAME | string | `` | database name |
| app.secretConfig.DB_USER | string | `` | database user |
| app.secretConfig.DB_PASSWORD | string | `` | database password |
| app.secretConfig.DB_SSL_MODE | string | `disable` | database ssl mode |
---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml odpf/columbus
```

> **Tip**: You can use the default [values.yaml](values.yaml)
