# Firehose

A [helm](https://helm.sh/) chart for [Firehose](https://github.com/odpf/firehose)

## Introduction

This chart can be used for deploying [Firehose](https://github.com/odpf/firehose) on Kubernetes using helm

## Prerequisites

Install [helm3](https://helm.sh/docs/intro/install/#helm)

## Installing the Chart

### Install released version using Helm repository

* Add the odpf charts repo
  
```bash
$ helm repo add odpf https://raystack.github.io/charts/
```

* Install it with Helm 3
  
```bash
$ helm install my-release odpf/firehose
```

### Install development version using master branch

```bash
$ helm install --name my-release .
```

The command deploys Firehose on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Usage notes

* Use init-firehose container in order to download and load proto jar files for Filter functionality
* Update flags for init-firehose and telegraf containers in order to use them, defaults are set to false
* Jolokia input for telegraf will be enabled only if jolokia is mentioned in JAVA_TOOL_OPTIONS in firehose config
* Sample Firehose configs are mentioned in values.yaml file, update them according to usecase, [read more](https://github.com/odpf/firehose/blob/main/docs/reference/configuration.md#configurations)
* Set the resource limits of containers according to the usage

## Configuration

The following table lists the configurable parameters of Firehose chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| firehose.args | list | `['java', '-cp', 'bin/*:/work-dir/*', 'io.odpf.firehose.launch.Main', '-server', '-Dlogback.configurationFile=etc/firehose/logback.xml', '-Xloggc:/var/log/firehose']` | args for firehose container |
| firehose.config | object | `{"SOURCE_KAFKA_BROKERS": "127.0.0.1:6667", "SOURCE_KAFKA_CONSUMER_GROUP_ID": "kafka-consumer-group-id", "SOURCE_KAFKA_TOPIC": "sample-topic", "SINK_TYPE": "log", "SOURCE_KAFKA_CONSUMER_CONFIG_AUTO_OFFSET_RESET": "latest", "INPUT_SCHEMA_PROTO_CLASS": "com.github.firehose.sampleLogProto.SampleLogMessage", "JAVA_TOOL_OPTIONS": "-javaagent:jolokia-jvm-agent.jar=port=8778,host=localhost"}` | env variables required by firehose, [read more](https://github.com/odpf/firehose/blob/main/docs/reference/configuration.md#configurations) |
| firehose.image.pullPolicy | string | `"IfNotPresent"` | the Kubernetes [imagePullPolicy](https://kubernetes.io/docs/concepts/containers/images/#updating-images) value for firehose container |
| firehose.image.repository | string | `"odpf/firehose"` | docker repository to download firehose image |
| firehose.image.tag | string | `"1.1.0"` | firehose docker image tag |
| firehose.resources.limits.cpu | string | `"200m"` | firehose container cpu limit |
| firehose.resources.limits.memory | string | `"512Mi"` | firehose container memory limit |
| firehose.resources.requests.cpu | string | `"200m"` | firehose container cpu requests |
| firehose.resources.requests.memory | string | `"512Mi"` | firehose container memory requests |
| fullnameOverride | string | `""` | overrides the fullname when used in the naming of resources |
| init-firehose.args | list | `[wget -O /work-dir/protos.jar http://proto_jar_url.jar]` | args for init-firehose container |
| init-firehose.command | list | `['/bin/sh', '-c']` | commands for init-firehose container |
| init-firehose.enabled | bool | `false` | flag for enabling init-firehose |
| init-firehose.image.pullPolicy | string | `"IfNotPresent"` | the Kubernetes [imagePullPolicy](https://kubernetes.io/docs/concepts/containers/images/#updating-images) value for init-firehose container |
| init-firehose.image.repository | string | `"busybox"` | docker repository to download init-firehose image |
| init-firehose.image.tag | string | `"latest"` | init-firehose docker image tag |
| labels | object | `{"application":"firehose"}` | labels for all resouces |
| nameOverride | string | `""` | overrides the chart name when used in the naming of resources |
| replicaCount | int | `1` | number of replicas of firehose pod |
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
$ helm install my-release -f values.yaml odpf/firehose
```

> **Tip**: You can use the default [values.yaml](values.yaml)
