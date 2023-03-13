# shield

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository                     | Name            | Version |
| ------------------------------ | --------------- | ------- |
| https://goto.github.io/charts/ | shield-app(app) | 0.3.0   |
| https://goto.github.io/charts/ | spicedb(app)    | 0.3.0   |

## Values

| Key                                                              | Type   | Default                         | Description |
| ---------------------------------------------------------------- | ------ | ------------------------------- | ----------- |
| shield-app.config.SHIELD_SPICEDB_HOST                            | string | `"spicedb.namespace.svc.local"` |             |
| shield-app.config.SHIELD_SPICEDB_PORT                            | int    | `50051`                         |             |
| shield-app.container.args[0]                                     | string | `"serve"`                       |             |
| shield-app.container.livenessProbe.httpGet.path                  | string | `"/ping"`                       |             |
| shield-app.container.livenessProbe.httpGet.port                  | int    | `5556`                          |             |
| shield-app.container.ports[0].containerPort                      | int    | `8080`                          |             |
| shield-app.container.ports[0].name                               | string | `"tcp"`                         |             |
| shield-app.container.ports[0].protocol                           | string | `"TCP"`                         |             |
| shield-app.container.ports[1].containerPort                      | int    | `5556`                          |             |
| shield-app.container.ports[1].name                               | string | `"proxy"`                       |             |
| shield-app.container.ports[1].protocol                           | string | `"TCP"`                         |             |
| shield-app.container.readinessProbe.httpGet.path                 | string | `"/ping"`                       |             |
| shield-app.container.readinessProbe.httpGet.port                 | int    | `5556`                          |             |
| shield-app.enabled                                               | bool   | `true`                          |             |
| shield-app.image.pullPolicy                                      | string | `"IfNotPresent"`                |             |
| shield-app.image.repository                                      | string | `"gotocompany/shield"`                 |             |
| shield-app.image.tag                                             | string | `"0.2.0-rc"`                    |             |
| shield-app.ingress.annotations."kubernetes.io/ingress.class"     | string | `"contour"`                     |             |
| shield-app.ingress.enabled                                       | bool   | `true`                          |             |
| shield-app.ingress.hosts[0].host                                 | string | `"shield.example.com"`          |             |
| shield-app.ingress.hosts[0].paths[0].backend.service.port.number | int    | `8080`                          |             |
| shield-app.ingress.hosts[0].paths[0].path                        | string | `"/admin"`                      |             |
| shield-app.ingress.hosts[0].paths[0].pathType                    | string | `"Prefix"`                      |             |
| shield-app.ingress.hosts[0].paths[1].backend.service.port.number | int    | `5556`                          |             |
| shield-app.ingress.hosts[0].paths[1].path                        | string | `"/"`                           |             |
| shield-app.ingress.hosts[0].paths[1].pathType                    | string | `"ImplementationSpecific"`      |             |
| shield-app.secretConfig.SHIELD_DB_URL                            | string | `nil`                           |             |
| shield-app.secretConfig.SHIELD_SPICEDB_PRE_SHARED_KEY            | string | `nil`                           |             |
| shield-app.service.annotations                                   | object | `{}`                            |             |
| shield-app.service.ports[0].name                                 | string | `"tcp"`                         |             |
| shield-app.service.ports[0].port                                 | int    | `8080`                          |             |
| shield-app.service.ports[0].protocol                             | string | `"TCP"`                         |             |
| shield-app.service.ports[0].targetPort                           | string | `"tcp"`                         |             |
| shield-app.service.ports[1].name                                 | string | `"proxy"`                       |             |
| shield-app.service.ports[1].port                                 | int    | `5556`                          |             |
| shield-app.service.ports[1].protocol                             | string | `"TCP"`                         |             |
| shield-app.service.ports[1].targetPort                           | string | `"proxy"`                       |             |
| shield-app.service.type                                          | string | `"ClusterIP"`                   |             |
| spicedb.config.SPICEDB_DATASTORE_ENGINE                          | string | `nil`                           |             |
| spicedb.config.SPICEDB_GRPC_SHUTDOWN_GRACE_PERIOD                | string | `"5s"`                          |             |
| spicedb.config.SPICEDB_LOG_LEVEL                                 | string | `"info"`                        |             |
| spicedb.container.command[0]                                     | string | `"spicedb"`                     |             |
| spicedb.container.command[1]                                     | string | `"serve"`                       |             |
| spicedb.container.livenessProbe.httpGet.path                     | string | `"/"`                           |             |
| spicedb.container.livenessProbe.httpGet.port                     | int    | `8080`                          |             |
| spicedb.container.ports[0].containerPort                         | int    | `50051`                         |             |
| spicedb.container.ports[0].name                                  | string | `"tcp"`                         |             |
| spicedb.container.ports[0].protocol                              | string | `"TCP"`                         |             |
| spicedb.container.readinessProbe.httpGet.path                    | string | `"/"`                           |             |
| spicedb.container.readinessProbe.httpGet.port                    | int    | `8080`                          |             |
| spicedb.enabled                                                  | bool   | `true`                          |             |
| spicedb.image.repository                                         | string | `"quay.io/authzed/spicedb"`     |             |
| spicedb.image.tag                                                | string | `"v1.2.0"`                      |             |
| spicedb.ingress.annotations."kubernetes.io/ingress.class"        | string | `"contour"`                     |             |
| spicedb.ingress.enabled                                          | bool   | `true`                          |             |
| spicedb.ingress.hosts[0].host                                    | string | `"spicedb.example.com"`         |             |
| spicedb.ingress.hosts[0].paths[0].backend.service.port.number    | int    | `80`                            |             |
| spicedb.ingress.hosts[0].paths[0].path                           | string | `"/"`                           |             |
| spicedb.ingress.hosts[0].paths[0].pathType                       | string | `"ImplementationSpecific"`      |             |
| spicedb.nameOverride                                             | string | `"shield-spicedb"`              |             |
| spicedb.replicaCount                                             | int    | `2`                             |             |
| spicedb.secretConfig.SPICEDB_DATASTORE_CONN_URI                  | string | `nil`                           |             |
| spicedb.secretConfig.SPICEDB_GRPC_PRESHARED_KEY                  | string | `nil`                           |             |

---

Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
