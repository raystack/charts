# APP Chart

A geenric [helm](https://helm.sh/) chart for any app

## TL;DR;

```bash
$ helm install [my-release] .
```

## Introduction

This chart can be used for deploying any app on kubenetes using helm

## Example for Installing an application

To install the chart with the release name `my-release` and image `siren`:

```bash
$ helm install --name my-release . -f ./path-to/values.yaml --set image.repository=odpf/siren --set image.tag=latest --set ingress.enabled=true

```

The command deploys odpf/siren on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete tghe `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Siren chart and their default values.


| Key                                   | Type   | Default                                                                                       | Description                                                          |
| ------------------------------------- | ------ | --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| affinity                              | object | `{}`                                                                                          |                                                                      |
| config                                | object | `{}`                                                                                          |                                                                      |
| container.command                     | list   | `[]`                                                                                          |                                                                      |
| container.entryPoint                  | list   | `[]`                                                                                          |                                                                      |
| container.livenessProbe.httpGet.path  | string | `"/"`                                                                                         |                                                                      |
| container.livenessProbe.httpGet.port  | string | `"tcp"`                                                                                       |                                                                      |
| container.port.containerPort          | int    | `8080`                                                                                        |                                                                      |
| container.port.name                   | string | `"tcp"`                                                                                       |                                                                      |
| container.port.protocol               | string | `"TCP"`                                                                                       |                                                                      |
| container.readinessProbe.httpGet.path | string | `"/"`                                                                                         |                                                                      |
| container.readinessProbe.httpGet.port | string | `"tcp"`                                                                                       |                                                                      |
| fullnameOverride                      | string | `""`                                                                                          |                                                                      |
| image.pullPolicy                      | string | `"IfNotPresent"`                                                                              | Specify the docker image path/repository.                            |
| image.repository                      | string | `nil`                                                                                         |                                                                      |
| image.tag                             | string | `"latest"`                                                                                    | Overrides the image tag whose default is the chart appVersion.       |
| imagePullSecrets                      | list   | `[]`                                                                                          |                                                                      |
| ingress.annotations                   | object | `{}`                                                                                          |                                                                      |
| ingress.className                     | string | `""`                                                                                          |                                                                      |
| ingress.enabled                       | bool   | `false`                                                                                       |                                                                      |
| ingress.hosts                         | list   | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | kubernetes.io/ingress.class: nginx -- kubernetes.io/tls-acme: "true" |
| ingress.tls                           | list   | `[]`                                                                                          |                                                                      |
| nameOverride                          | string | `""`                                                                                          |                                                                      |
| nodeSelector                          | object | `{}`                                                                                          |                                                                      |
| podAnnotations                        | object | `{}`                                                                                          |                                                                      |
| podSecurityContext                    | object | `{}`                                                                                          |                                                                      |
| replicaCount                          | int    | `1`                                                                                           |                                                                      |
| resources                             | object | `{}`                                                                                          |                                                                      |
| securityContext                       | object | `{}`                                                                                          |                                                                      |
| service.port.name                     | string | `"tcp"`                                                                                       |                                                                      |
| service.port.port                     | int    | `80`                                                                                          |                                                                      |
| service.port.protocol                 | string | `"TCP"`                                                                                       |                                                                      |
| service.port.targetPort               | string | `"tcp"`                                                                                       |                                                                      |
| service.type                          | string | `"ClusterIP"`                                                                                 |                                                                      |
| tolerations                           | list   | `[]`                                                                                          |                                                                      |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/siren
```

> **Tip**: You can use the default [values.yaml](values.yaml)
