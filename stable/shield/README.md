# Shield

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.0.1](https://img.shields.io/badge/AppVersion-v0.0.1-informational?style=flat-square)

## Introduction

This chart can be used for deploying [Shield](https://github.com/odpf/shield) on kubenetes using helm

**Homepage:** <https://github.com/odpf/shield>

## Source Code

- <https://github.com/odpf/shield>
- <https://github.com/odpf/charts>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
helm repo add odpf https://odpf.github.io/charts/
helm install my-release odpf/shield
```

The command deploys Shield on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Shield chart and their default values.

## Values

| Key                                | Type   | Default                                                   | Description                                                                                                                                                                            |
| ---------------------------------- | ------ | --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| affinity                           | object | `{}`                                                      |                                                                                                                                                                                        |
| config.APP_NAME                    | string | `"shield"`                                                |                                                                                                                                                                                        |
| config.NEW_RELIC_ENABLED           | string | `""`                                                      |                                                                                                                                                                                        |
| config.NEW_RELIC_KEY               | string | `""`                                                      |                                                                                                                                                                                        |
| config.NODE_ENV                    | string | `"production"`                                            |                                                                                                                                                                                        |
| config.PORT                        | int    | `80`                                                      |                                                                                                                                                                                        |
| image.pullPolicy                   | string | `"IfNotPresent"`                                          |                                                                                                                                                                                        |
| image.repository                   | string | `"odpf/shield"`                                           |                                                                                                                                                                                        |
| image.tag                          | string | `"v0.0.1"`                                                |                                                                                                                                                                                        |
| ingress.annotations                | object | `{"kubernetes.io/ingress.class":"contour"}`               | Used to add custom labels to the Ingress Useful if for example you have multiple Ingress controllers and want your Ingress controllers to bind to specific Ingresses traffic: internal |
| ingress.enabled                    | bool   | `true`                                                    | Kubernetes ingress details                                                                                                                                                             |
| ingress.hosts                      | list   | `["shield.example.com"]`                                  | Used to create Ingress record (should used with service.type: ClusterIP).                                                                                                              |
| ingress.labels                     | string | `nil`                                                     |                                                                                                                                                                                        |
| ingress.path                       | string | `"/"`                                                     | The ingress path. Useful to host shield on a subpath, such as `/v1`.                                                                                                                   |
| labels                             | object | `{}`                                                      |                                                                                                                                                                                        |
| livenessProbe.failureThreshold     | int    | `6`                                                       |                                                                                                                                                                                        |
| livenessProbe.httpGetPath          | string | `"/ping"`                                                 | Kubernetes liveness probe configs                                                                                                                                                      |
| livenessProbe.initialDelaySeconds  | int    | `120`                                                     |                                                                                                                                                                                        |
| livenessProbe.timeoutSeconds       | int    | `30`                                                      |                                                                                                                                                                                        |
| nodeSelector                       | object | `{}`                                                      |                                                                                                                                                                                        |
| podAnnotations                     | object | `{}`                                                      |                                                                                                                                                                                        |
| readinessProbe.httpGetPath         | string | `"/ping"`                                                 | Kubernetes readiness probe configs                                                                                                                                                     |
| readinessProbe.initialDelaySeconds | int    | `30`                                                      |                                                                                                                                                                                        |
| readinessProbe.periodSeconds       | int    | `5`                                                       |                                                                                                                                                                                        |
| readinessProbe.timeoutSeconds      | int    | `3`                                                       |                                                                                                                                                                                        |
| replicaCount                       | int    | `1`                                                       |                                                                                                                                                                                        |
| resources                          | object | `{}`                                                      |                                                                                                                                                                                        |
| secretConfig.DB_URI                | string | `"postgresql://shield_dev:123@localhost:5432/shield_dev"` | Postgres database connection details                                                                                                                                                   |
| service.annotations                | object | `{}`                                                      |                                                                                                                                                                                        |
| service.externalPort               | int    | `80`                                                      |                                                                                                                                                                                        |
| service.internalPort               | int    | `80`                                                      |                                                                                                                                                                                        |
| service.nodePort                   | string | `nil`                                                     | Used to fix NodePort when service.type: NodePort.                                                                                                                                      |
| service.type                       | string | `"ClusterIP"`                                             | Kubernetes service details                                                                                                                                                             |
| tolerations                        | list   | `[]`                                                      |                                                                                                                                                                                        |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/shield
```

> **Tip**: You can use the default [values.yaml](values.yaml)
