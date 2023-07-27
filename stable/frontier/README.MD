# frontier

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository                         | Name              | Version |
| ---------------------------------- | ----------------- | ------- |
| https://raystack.github.io/charts/ | frontier-app(app) | 0.3.0   |
| https://raystack.github.io/charts/ | spicedb(app)      | 0.3.0   |

## Values

| Key                                                                | Type   | Default                         | Description |
| ------------------------------------------------------------------ | ------ | ------------------------------- | ----------- |
| frontier-app.config.SHIELD_SPICEDB_HOST                            | string | `"spicedb.namespace.svc.local"` |             |
| frontier-app.config.SHIELD_SPICEDB_PORT                            | int    | `50051`                         |             |
| frontier-app.container.args[0]                                     | string | `"serve"`                       |             |
| frontier-app.container.livenessProbe.httpGet.path                  | string | `"/ping"`                       |             |
| frontier-app.container.livenessProbe.httpGet.port                  | int    | `5556`                          |             |
| frontier-app.container.ports[0].containerPort                      | int    | `8080`                          |             |
| frontier-app.container.ports[0].name                               | string | `"tcp"`                         |             |
| frontier-app.container.ports[0].protocol                           | string | `"TCP"`                         |             |
| frontier-app.container.ports[1].containerPort                      | int    | `5556`                          |             |
| frontier-app.container.ports[1].name                               | string | `"proxy"`                       |             |
| frontier-app.container.ports[1].protocol                           | string | `"TCP"`                         |             |
| frontier-app.container.readinessProbe.httpGet.path                 | string | `"/ping"`                       |             |
| frontier-app.container.readinessProbe.httpGet.port                 | int    | `5556`                          |             |
| frontier-app.enabled                                               | bool   | `true`                          |             |
| frontier-app.image.pullPolicy                                      | string | `"IfNotPresent"`                |             |
| frontier-app.image.repository                                      | string | `"raystack/frontier"`           |             |
| frontier-app.image.tag                                             | string | `"0.2.0-rc"`                    |             |
| frontier-app.ingress.annotations."kubernetes.io/ingress.class"     | string | `"contour"`                     |             |
| frontier-app.ingress.enabled                                       | bool   | `true`                          |             |
| frontier-app.ingress.hosts[0].host                                 | string | `"frontier.example.com"`        |             |
| frontier-app.ingress.hosts[0].paths[0].backend.service.port.number | int    | `8080`                          |             |
| frontier-app.ingress.hosts[0].paths[0].path                        | string | `"/admin"`                      |             |
| frontier-app.ingress.hosts[0].paths[0].pathType                    | string | `"Prefix"`                      |             |
| frontier-app.ingress.hosts[0].paths[1].backend.service.port.number | int    | `5556`                          |             |
| frontier-app.ingress.hosts[0].paths[1].path                        | string | `"/"`                           |             |
| frontier-app.ingress.hosts[0].paths[1].pathType                    | string | `"ImplementationSpecific"`      |             |
| frontier-app.secretConfig.SHIELD_DB_URL                            | string | `nil`                           |             |
| frontier-app.secretConfig.SHIELD_SPICEDB_PRE_SHARED_KEY            | string | `nil`                           |             |
| frontier-app.service.annotations                                   | object | `{}`                            |             |
| frontier-app.service.ports[0].name                                 | string | `"tcp"`                         |             |
| frontier-app.service.ports[0].port                                 | int    | `8080`                          |             |
| frontier-app.service.ports[0].protocol                             | string | `"TCP"`                         |             |
| frontier-app.service.ports[0].targetPort                           | string | `"tcp"`                         |             |
| frontier-app.service.ports[1].name                                 | string | `"proxy"`                       |             |
| frontier-app.service.ports[1].port                                 | int    | `5556`                          |             |
| frontier-app.service.ports[1].protocol                             | string | `"TCP"`                         |             |
| frontier-app.service.ports[1].targetPort                           | string | `"proxy"`                       |             |
| frontier-app.service.type                                          | string | `"ClusterIP"`                   |             |
| spicedb.config.SPICEDB_DATASTORE_ENGINE                            | string | `nil`                           |             |
| spicedb.config.SPICEDB_GRPC_SHUTDOWN_GRACE_PERIOD                  | string | `"5s"`                          |             |
| spicedb.config.SPICEDB_LOG_LEVEL                                   | string | `"info"`                        |             |
| spicedb.container.command[0]                                       | string | `"spicedb"`                     |             |
| spicedb.container.command[1]                                       | string | `"serve"`                       |             |
| spicedb.container.livenessProbe.httpGet.path                       | string | `"/"`                           |             |
| spicedb.container.livenessProbe.httpGet.port                       | int    | `8080`                          |             |
| spicedb.container.ports[0].containerPort                           | int    | `50051`                         |             |
| spicedb.container.ports[0].name                                    | string | `"tcp"`                         |             |
| spicedb.container.ports[0].protocol                                | string | `"TCP"`                         |             |
| spicedb.container.readinessProbe.httpGet.path                      | string | `"/"`                           |             |
| spicedb.container.readinessProbe.httpGet.port                      | int    | `8080`                          |             |
| spicedb.enabled                                                    | bool   | `true`                          |             |
| spicedb.image.repository                                           | string | `"quay.io/authzed/spicedb"`     |             |
| spicedb.image.tag                                                  | string | `"v1.2.0"`                      |             |
| spicedb.ingress.annotations."kubernetes.io/ingress.class"          | string | `"contour"`                     |             |
| spicedb.ingress.enabled                                            | bool   | `true`                          |             |
| spicedb.ingress.hosts[0].host                                      | string | `"spicedb.example.com"`         |             |
| spicedb.ingress.hosts[0].paths[0].backend.service.port.number      | int    | `80`                            |             |
| spicedb.ingress.hosts[0].paths[0].path                             | string | `"/"`                           |             |
| spicedb.ingress.hosts[0].paths[0].pathType                         | string | `"ImplementationSpecific"`      |             |
| spicedb.nameOverride                                               | string | `"frontier-spicedb"`            |             |
| spicedb.replicaCount                                               | int    | `2`                             |             |
| spicedb.secretConfig.SPICEDB_DATASTORE_CONN_URI                    | string | `nil`                           |             |
| spicedb.secretConfig.SPICEDB_GRPC_PRESHARED_KEY                    | string | `nil`                           |             |

---

Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
