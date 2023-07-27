# Raccoon

[Raccoon](https://github.com/raystack/raccoon) is high throughput, low-latency service that provides an API to ingest clickstream data from mobile apps, sites and publish it to Kafka.

## TL;DR

```
$ helm install my-release raystack/raccoon
```

The service will listen to `:8080` and publish to `host.docker.internal:9093` Kafka by default.

## Introduction

This chart runs [Raccoon](https://github.com/raystack/raccoon) deployment on [Kubernetes](https://kubernetes.io/) using [Helm](https://helm.sh/) package manager. The deployment contains Raccoon service and [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) as a sidecar.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Installing the Chart

### Install released version using Helm repository

**Add the raystack charts repo**

```bash
$ helm repo add raystack https://raystack.github.io/charts/
```

**Install it with Helm 3**

Make sure you are in the correct Kubernetes context. Run the following command to deploy Raccoon. On the following command, you can adjust `PUBLISHER_KAFKA_CLIENT_BOOTSTRAP_SERVERS` and `SERVER_WEBSOCKET_PORT` as needed.

```bash
$ helm install my-release raystack/raccoon \
  --set raccoon.config.PUBLISHER_KAFKA_CLIENT_BOOTSTRAP_SERVERS=localhost:9092 \
  --set raccoon.config.SERVER_WEBSOCKET_PORT=8080
```

The command above will deploy the Raccoon server with `LoadBalancer` service. If you run it locally using [docker-desktop](https://docs.docker.com/desktop/kubernetes/), you can access the server on `localhost`. When successfully deployed, you will see deployment notes like the following.

```
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Mon May  3 13:54:36 2021
NAMESPACE: default
STATUS: deployed
REVISION: 53
TEST SUITE: None
NOTES:
Thank you for installing raccoon.

Your release is named my-release.

Resource created:
  DEPLOYMENT:
    - Raccoon server
  SERVICE:
    - LoadBalancer

To learn more about the release, try:

  $ helm status my-release
  $ helm get all my-release
```

For other deployment options, you can check [section below](#deployment-options). For more configurations, you can check The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of Raccoon chart and their default values.

| Key                                              | Type     | Default                                                                                                                                                                                                                 | Description                                                                                                                           |
| ------------------------------------------------ | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| raccoon.config                                   | object   | `{"SERVER_WEBSOCKET_PORT": "8080", "SERVER_WEBSOCKET_CONN_UNIQ_ID_HEADER": "x-user-id", "PUBLISHER_KAFKA_CLIENT_BOOTSTRAP_SERVERS": "host.docker.internal:9094", "METRIC_STATSD_ADDRESS": "host.docker.internal:8125"}` | env variables required by raccoon, [read more](https://raystack.gitbook.io/raccoon/reference/configurations)                          |
| raccoon.image.pullPolicy                         | string   | `"IfNotPresent"`                                                                                                                                                                                                        | the Kubernetes [imagePullPolicy](https://kubernetes.io/docs/concepts/containers/images/#updating-images) value for raccoon container  |
| raccoon.image.repository                         | string   | `"raystack/raccoon"`                                                                                                                                                                                                    | docker repository to download raccoon image                                                                                           |
| raccoon.image.tag                                | string   | `"0.1.0"`                                                                                                                                                                                                               | raccoon docker image tag                                                                                                              |
| raccoon.resources.limits.cpu                     | string   | `"200m"`                                                                                                                                                                                                                | raccoon container cpu limit                                                                                                           |
| raccoon.resources.limits.memory                  | string   | `"512Mi"`                                                                                                                                                                                                               | raccoon container memory limit                                                                                                        |
| raccoon.resources.requests.cpu                   | string   | `"200m"`                                                                                                                                                                                                                | raccoon container cpu requests                                                                                                        |
| raccoon.resources.requests.memory                | string   | `"512Mi"`                                                                                                                                                                                                               | raccoon container memory requests                                                                                                     |
| service.type                                     | string   | `LoadBalancer`                                                                                                                                                                                                          | kubernetes service type                                                                                                               |
| service.annotations                              | string   | `{}`                                                                                                                                                                                                                    | service annotations                                                                                                                   |
| service.clusterIP                                | string   |                                                                                                                                                                                                                         |                                                                                                                                       |
| ingress.enabled                                  | bool     | `false`                                                                                                                                                                                                                 | flag for enabling ingress                                                                                                             |
| ingress.path                                     | string   | `/`                                                                                                                                                                                                                     | path which will be forwaded to raccoon                                                                                                |
| ingress.annotations                              | object   | `{}`                                                                                                                                                                                                                    | ingress annotations                                                                                                                   |
| ingress.hosts                                    | []string | `["localhost"]`                                                                                                                                                                                                         | host for which the ingress is applied                                                                                                 |
| ingress.tls.enabled                              | bool     | `false`                                                                                                                                                                                                                 | flag for enabling tls ingress                                                                                                         |
| ingress.tls.secretName                           | string   | `secret`                                                                                                                                                                                                                | secret name where the certificate and private key are stored                                                                          |
| fullnameOverride                                 | string   | `""`                                                                                                                                                                                                                    | overrides the fullname when used in the naming of resources                                                                           |
| labels                                           | object   | `{"application":"raccoon"}`                                                                                                                                                                                             | labels for all resouces                                                                                                               |
| nameOverride                                     | string   | `""`                                                                                                                                                                                                                    | overrides the chart name when used in the naming of resources                                                                         |
| replicaCount                                     | int      | `1`                                                                                                                                                                                                                     | number of replicas of raccoon pod                                                                                                     |
| telegraf.config.output.influxdb.database         | string   | `"test-db"`                                                                                                                                                                                                             | db name for telegraf influxdb output                                                                                                  |
| telegraf.config.output.influxdb.enabled          | bool     | `false`                                                                                                                                                                                                                 | flag for enabling telegraf influxdb output                                                                                            |
| telegraf.config.output.influxdb.retention_policy | string   | `"autogen"`                                                                                                                                                                                                             | retention policy for telegraf influxdb output                                                                                         |
| telegraf.config.output.influxdb.urls             | list     | `["http://localhost:8086"]`                                                                                                                                                                                             | influxdb urls for telegraf output                                                                                                     |
| telegraf.enabled                                 | bool     | `false`                                                                                                                                                                                                                 | flag for enabling telegraf                                                                                                            |
| telegraf.image.pullPolicy                        | string   | `"IfNotPresent"`                                                                                                                                                                                                        | the Kubernetes [imagePullPolicy](https://kubernetes.io/docs/concepts/containers/images/#updating-images) value for telegraf container |
| telegraf.image.repository                        | string   | `"telegraf"`                                                                                                                                                                                                            | docker repository to download telegraf image                                                                                          |
| telegraf.image.tag                               | string   | `"1.7.4-alpine"`                                                                                                                                                                                                        | telegraf docker image tag                                                                                                             |
| telegraf.resources.limits.cpu                    | string   | `"50m"`                                                                                                                                                                                                                 | telegraf container cpu limit                                                                                                          |
| telegraf.resources.limits.memory                 | string   | `"64Mi"`                                                                                                                                                                                                                | telegraf container memory limit                                                                                                       |
| telegraf.resources.requests.cpu                  | string   | `"50m"`                                                                                                                                                                                                                 | telegraf container cpu requests                                                                                                       |
| telegraf.resources.requests.memory               | string   | `"64Mi"`                                                                                                                                                                                                                | telegraf container memory requests                                                                                                    |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml raystack/raccoon
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Deployment Options

The deployment is configurable by [overriding](https://helm.sh/docs/chart_template_guide/values_files/) `values.yaml` values. This section will explain other ways to use the chart.

### Enable Telegraf As Sidecar

Raccoon uses [statsd](https://www.datadoghq.com/blog/statsd/) to report metrics. Telegraf has statsd input plugin and has Influx output plugin. Once stored in Influx, the metrics can be visualized by using Grafana. More of that you can find it [here]().
This chart includes Telegraf as sidecar. By default the sidecar is not enabled. To enable the Telegraf sidecar, you need to set `telegraf.enabled` and `telegraf.config.output.influxdb` to true.
You also need to adjust `telegraf.config.output.influxdb.urls`, `telegraf.config.output.influxdb.database`, and `telegraf.config.output.influxdb.retention_policy`. By default, Raccoon is pointing to `:8086` for [METRIC_STATSD_ADDRESS](https://raystack.gitbook.io/raccoon/reference/configurations#metric_statsd_address). In which, will publish the metrics to the sidecar Telegraf.
Example of Telegraf enabled `values.yaml`

```
telegraf:
  enabled: true
  image:
    repository: telegraf
    pullPolicy: IfNotPresent
    tag: 1.7.4-alpine
  config:
    output:
      influxdb:
        enabled: true
        urls:
          - "http://host.docker.internal:8086"
        database: "test-db"
        retention_policy: "autogen"
```

### Add Raccoon Configurations

Apart from default Raccoon configurations mentioned above, Raccoon also has other application level [configurations](https://raystack.gitbook.io/raccoon/reference/configurations). You can provide the configuration under `raccoon.config.*`. Refer below for example

```
raccoon:
  config:
    SERVER_WEBSOCKET_PORT: "8080"
    SERVER_WEBSOCKET_CONN_UNIQ_ID_HEADER: x-user-id
    PUBLISHER_KAFKA_CLIENT_BOOTSTRAP_SERVERS: host.docker.internal:9093
    METRIC_STATSD_ADDRESS: host.docker.internal:8125
    WORKER_POOL_SIZE: 50
    SERVER_WEBSOCKET_PINGER_SIZE: 5
    # You can keep adding Raccoon config
```

### Setup Ingress On Raccon

This chart provides [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) capability. Ingress controller is not part of the chart. You need to setup ingress controller separately. Each ingress controller will have [slightly different way](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/) to configure.

To enable ingress, you need to set `ingress.enabled` to true. After that, you need to set `ingress.annontations` according to the ingress controller.

You can also enable TLS. First, you need to provide [Secret](https://kubernetes.io/docs/concepts/configuration/secret/) that contains private key and certificate. After you have the secret ready, `ingress.tls.enabled` to true and fill `ingress.tls.secretName` with the secret name. For more information about kubernetes TLS ingress, you can read about it on the [official doc](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls).
