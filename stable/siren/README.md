# Siren

A [helm](https://helm.sh/) chart for [Siren](https://github.com/odpf/siren)

## TL;DR;

```bash
$ helm install [my-release] .
```

## Introduction

This chart can be used for deploying [Siren](https://github.com/odpf/siren) on kubenetes using helm

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release .
```

The command deploys Siren on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Siren chart and their default values.

## Values

| Key                                | Type   | Default                                               | Description                                                                                                                                                                            |
| ---------------------------------- | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| affinity                           | object | `{}`                                                  |                                                                                                                                                                                        |
| config                             | object | `{"CORTEX_ALERTMANAGER_URL":"http://localhost:8080"}` | Environement variables needed by siren                                                                                                                                                 |
| image.pullPolicy                   | string | `"IfNotPresent"`                                      |                                                                                                                                                                                        |
| image.repository                   | string | `"odpf/siren"`                                        | Image to use for deploying siren                                                                                                                                                       |
| image.tag                          | string | `"v0.0.1"`                                            |                                                                                                                                                                                        |
| ingress.annotations                | object | `{"kubernetes.io/ingress.class":"contour"}`           | Used to add custom labels to the Ingress Useful if for example you have multiple Ingress controllers and want your Ingress controllers to bind to specific Ingresses traffic: internal |
| ingress.enabled                    | bool   | `true`                                                | Kubernetes ingress details                                                                                                                                                             |
| ingress.hosts                      | list   | `["siren.example.com"]`                               | Used to create Ingress record (should used with service.type: ClusterIP).                                                                                                              |
| ingress.labels                     | string | `nil`                                                 |                                                                                                                                                                                        |
| ingress.path                       | string | `"/"`                                                 | The ingress path. Useful to host siren on a subpath, such as `/v1`.                                                                                                                    |
| labels                             | object | `{}`                                                  |                                                                                                                                                                                        |
| livenessProbe.failureThreshold     | int    | `6`                                                   |                                                                                                                                                                                        |
| livenessProbe.httpGetPath          | string | `"/ping"`                                             | Kubernetes liveness probe configs                                                                                                                                                      |
| livenessProbe.initialDelaySeconds  | int    | `120`                                                 |                                                                                                                                                                                        |
| livenessProbe.timeoutSeconds       | int    | `30`                                                  |                                                                                                                                                                                        |
| nodeSelector                       | object | `{}`                                                  |                                                                                                                                                                                        |
| podAnnotations                     | object | `{}`                                                  |                                                                                                                                                                                        |
| readinessProbe.httpGetPath         | string | `"/ping"`                                             | Kubernetes readiness probe configs                                                                                                                                                     |
| readinessProbe.initialDelaySeconds | int    | `30`                                                  |                                                                                                                                                                                        |
| readinessProbe.periodSeconds       | int    | `5`                                                   |                                                                                                                                                                                        |
| readinessProbe.timeoutSeconds      | int    | `3`                                                   |                                                                                                                                                                                        |
| replicaCount                       | int    | `1`                                                   |                                                                                                                                                                                        |
| resources                          | object | `{}`                                                  |                                                                                                                                                                                        |
| secretConfig.DB_HOST               | string | `"localhost"`                                         | Postgres database connection details                                                                                                                                                   |
| secretConfig.DB_NAME               | string | `"siren"`                                             |                                                                                                                                                                                        |
| secretConfig.DB_PASSWORD           | string | `""`                                                  |                                                                                                                                                                                        |
| secretConfig.DB_PORT               | int    | `5432`                                                |                                                                                                                                                                                        |
| secretConfig.DB_USER               | string | `""`                                                  |                                                                                                                                                                                        |
| service.annotations                | object | `{}`                                                  |                                                                                                                                                                                        |
| service.externalPort               | int    | `80`                                                  |                                                                                                                                                                                        |
| service.internalPort               | int    | `3000`                                                |                                                                                                                                                                                        |
| service.nodePort                   | string | `nil`                                                 | Used to fix NodePort when service.type: NodePort.                                                                                                                                      |
| service.type                       | string | `"ClusterIP"`                                         | Kubernetes service details                                                                                                                                                             |
| tolerations                        | list   | `[]`                                                  |                                                                                                                                                                                        |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/siren
```

> **Tip**: You can use the default [values.yaml](values.yaml)
