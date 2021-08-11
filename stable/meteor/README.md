# Meteor

A [helm](https://helm.sh/) chart for [Meteor](https://github.com/odpf/meteor)

## TL;DR;

```bash
$ helm install [my-release] .
```

## Introduction

This chart can be used for deploying [Meteor](https://github.com/odpf/meteor) on kubenetes using helm

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release .
```

The command deploys Meteor on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Meteor chart and their default values.

## Values

| Key | Type | Default | Description |
| --- | ---- | ------- | ----------- |
| recipes | [][Recipe](#recipe) | sample values  |  |
| jobName | string | `main-kafka-production`  |  |
| namespace | string | `default` | k8s namespace |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"odpf/meteor"` | Image to use for deploying siren |
| image.tag | string | `"0.1.0"` |  |
| labels | object | `{}` |  |

### Recipe
| Field | Sample Value |
| :---- | :---- |
| `key` | `recipe-name.yaml` |
| `localPath` | `/path-to-recipe/recipe-name.yaml` |

---

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/meteor
```

> **Tip**: You can use the default [values.yaml](values.yaml)
