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
| frontier-app.config.FRONTIER_APP_BILLING_REFRESH_INTERVAL_CHECKOUT | int    | `0`                             |             |
| frontier-app.config.FRONTIER_APP_BILLING_REFRESH_INTERVAL_CUSTOMER | int    | `0`                             |             |
| frontier-app.config.FRONTIER_APP_BILLING_REFRESH_INTERVAL_INVOICE  | int    | `0`                             |             |
| frontier-app.config.FRONTIER_APP_BILLING_REFRESH_INTERVAL_SUBSCRIPTION | int    | `0`                             |             |
| frontier-app.config.FRONTIER_APP_CONNECT_PORT                      | int    | `8082`                          |             |
| frontier-app.config.FRONTIER_DB_DRIVER                             | string | `"postgres"`                    |             |
| frontier-app.config.FRONTIER_LOG_LEVEL                             | string | `"info"`                        |             |
| frontier-app.config.FRONTIER_SPICEDB_HOST                          | string | `"spicedb.namespace.svc.local"` |             |
| frontier-app.config.FRONTIER_SPICEDB_PORT                          | int    | `50051`                         |             |
| frontier-app.container.command[0]                                  | string | `"frontier"`                    |             |
| frontier-app.container.command[1]                                  | string | `"server"`                      |             |
| frontier-app.container.command[2]                                  | string | `"start"`                       |             |
| frontier-app.container.livenessProbe.grpc.port                     | int    | `8082`                          |             |
| frontier-app.container.ports[0].containerPort                      | int    | `3000`                          |             |
| frontier-app.container.ports[0].name                               | string | `"admin-ui"`                    |             |
| frontier-app.container.ports[0].protocol                           | string | `"TCP"`                         |             |
| frontier-app.container.ports[1].containerPort                      | int    | `8082`                          |             |
| frontier-app.container.ports[1].name                               | string | `"connectrpc"`                  |             |
| frontier-app.container.ports[1].protocol                           | string | `"TCP"`                         |             |
| frontier-app.container.readinessProbe.grpc.port                    | int    | `8082`                          |             |
| frontier-app.enabled                                               | bool   | `true`                          |             |
| frontier-app.image.pullPolicy                                      | string | `"IfNotPresent"`                |             |
| frontier-app.image.repository                                      | string | `"raystack/frontier"`           |             |
| frontier-app.image.tag                                             | string | `"v0.90.0"`                     |             |
| frontier-app.ingress.annotations                                   | object | `{}`                            |             |
| frontier-app.ingress.enabled                                       | bool   | `false`                         |             |
| frontier-app.ingress.hosts[0].host                                 | string | `"frontier.example.com"`        |             |
| frontier-app.ingress.hosts[0].paths[0].backend.service.port.number | int    | `8082`                          |             |
| frontier-app.ingress.hosts[0].paths[0].path                        | string | `"/"`                           |             |
| frontier-app.ingress.hosts[0].paths[0].pathType                    | string | `"Prefix"`                      |             |
| frontier-app.secretConfig.FRONTIER_DB_URL                          | string | `nil`                           |             |
| frontier-app.secretConfig.FRONTIER_SPICEDB_PRE_SHARED_KEY          | string | `nil`                           |             |
| frontier-app.service.annotations                                   | object | `{}`                            |             |
| frontier-app.service.ports[0].name                                 | string | `"admin-ui"`                    |             |
| frontier-app.service.ports[0].port                                 | int    | `3000`                          |             |
| frontier-app.service.ports[0].protocol                             | string | `"TCP"`                         |             |
| frontier-app.service.ports[0].targetPort                           | string | `"admin-ui"`                    |             |
| frontier-app.service.ports[1].name                                 | string | `"connectrpc"`                  |             |
| frontier-app.service.ports[1].port                                 | int    | `8082`                          |             |
| frontier-app.service.ports[1].protocol                             | string | `"TCP"`                         |             |
| frontier-app.service.ports[1].targetPort                           | string | `"connectrpc"`                  |             |
| frontier-app.service.type                                          | string | `"ClusterIP"`                   |             |
| frontier-worker.config.FRONTIER_APP_CONNECT_PORT                   | int    | `8082`                          |             |
| frontier-worker.config.FRONTIER_DB_DRIVER                          | string | `"postgres"`                    |             |
| frontier-worker.config.FRONTIER_LOG_LEVEL                          | string | `"info"`                        |             |
| frontier-worker.config.FRONTIER_SPICEDB_HOST                       | string | `"spicedb.namespace.svc.local"` |             |
| frontier-worker.config.FRONTIER_SPICEDB_PORT                       | int    | `50051`                         |             |
| frontier-worker.container.command[0]                               | string | `"frontier"`                    |             |
| frontier-worker.container.command[1]                               | string | `"server"`                      |             |
| frontier-worker.container.command[2]                               | string | `"start"`                       |             |
| frontier-worker.container.livenessProbe.grpc.port                  | int    | `8082`                          |             |
| frontier-worker.container.ports[0].containerPort                   | int    | `3000`                          |             |
| frontier-worker.container.ports[0].name                            | string | `"admin-ui"`                    |             |
| frontier-worker.container.ports[0].protocol                        | string | `"TCP"`                         |             |
| frontier-worker.container.ports[1].containerPort                   | int    | `8082`                          |             |
| frontier-worker.container.ports[1].name                            | string | `"connectrpc"`                  |             |
| frontier-worker.container.ports[1].protocol                        | string | `"TCP"`                         |             |
| frontier-worker.container.readinessProbe.grpc.port                 | int    | `8082`                          |             |
| frontier-worker.enabled                                            | bool   | `true`                          |             |
| frontier-worker.image.pullPolicy                                   | string | `"IfNotPresent"`                |             |
| frontier-worker.image.repository                                   | string | `"raystack/frontier"`           |             |
| frontier-worker.image.tag                                          | string | `"v0.65.0"`                     |             |
| frontier-worker.ingress.enabled                                    | bool   | `false`                         |             |
| frontier-worker.replicaCount                                       | int    | `1`                             |             |
| frontier-worker.secretConfig.FRONTIER_DB_URL                       | string | `nil`                           |             |
| frontier-worker.secretConfig.FRONTIER_SPICEDB_PRE_SHARED_KEY       | string | `nil`                           |             |
| frontier-worker.service.enabled                                    | bool   | `false`                         |             |
| spicedb.config.SPICEDB_DATASTORE_ENGINE                            | string | `nil`                           |             |
| spicedb.config.SPICEDB_GRPC_ENABLED                                | string | `"true"`                        |             |
| spicedb.config.SPICEDB_GRPC_SHUTDOWN_GRACE_PERIOD                  | string | `"5s"`                          |             |
| spicedb.config.SPICEDB_HTTP_ENABLED                                | string | `"true"`                        |             |
| spicedb.config.SPICEDB_LOG_LEVEL                                   | string | `"info"`                        |             |
| spicedb.container.command[0]                                       | string | `"spicedb"`                     |             |
| spicedb.container.command[1]                                       | string | `"serve"`                       |             |
| spicedb.container.livenessProbe.exec.command[0]                    | string | `"grpc_health_probe"`           |             |
| spicedb.container.livenessProbe.exec.command[1]                    | string | `"-v"`                          |             |
| spicedb.container.livenessProbe.exec.command[2]                    | string | `"-addr=localhost:50051"`       |             |
| spicedb.container.ports[0].containerPort                           | int    | `50051`                         |             |
| spicedb.container.ports[0].protocol                                | string | `"TCP"`                         |             |
| spicedb.container.ports[1].containerPort                           | int    | `8443`                          |             |
| spicedb.container.ports[1].protocol                                | string | `"TCP"`                         |             |
| spicedb.container.readinessProbe.exec.command[0]                   | string | `"grpc_health_probe"`           |             |
| spicedb.container.readinessProbe.exec.command[1]                   | string | `"-v"`                          |             |
| spicedb.container.readinessProbe.exec.command[2]                   | string | `"-addr=localhost:50051"`       |             |
| spicedb.enabled                                                    | bool   | `true`                          |             |
| spicedb.image.repository                                           | string | `"quay.io/authzed/spicedb"`     |             |
| spicedb.image.tag                                                  | string | `"v1.30.1"`                     |             |
| spicedb.ingress.annotations                                        | object | `{}`                            |             |
| spicedb.ingress.enabled                                            | bool   | `false`                         |             |
| spicedb.ingress.hosts[0].host                                      | string | `"spicedb.example.com"`         |             |
| spicedb.ingress.hosts[0].paths[0].backend.service.port.number      | int    | `80`                            |             |
| spicedb.ingress.hosts[0].paths[0].path                             | string | `"/"`                           |             |
| spicedb.ingress.hosts[0].paths[0].pathType                         | string | `"ImplementationSpecific"`      |             |
| spicedb.nameOverride                                               | string | `"frontier-spicedb"`            |             |
| spicedb.replicaCount                                               | int    | `2`                             |             |
| spicedb.secretConfig.SPICEDB_DATASTORE_CONN_URI                    | string | `nil`                           |             |
| spicedb.secretConfig.SPICEDB_GRPC_PRESHARED_KEY                    | string | `nil`                           |             |
| spicedb.service.annotations                                        | object | `{}`                            |             |
| spicedb.service.ports[0].name                                      | string | `"rest"`                        |             |
| spicedb.service.ports[0].port                                      | int    | `80`                            |             |
| spicedb.service.ports[0].protocol                                  | string | `"TCP"`                         |             |
| spicedb.service.ports[0].targetPort                                | int    | `8443`                          |             |
| spicedb.service.ports[1].name                                      | string | `"grpc"`                        |             |
| spicedb.service.ports[1].port                                      | int    | `50051`                         |             |
| spicedb.service.ports[1].protocol                                  | string | `"TCP"`                         |             |
| spicedb.service.ports[1].targetPort                                | int    | `50051`                         |             |
| spicedb.service.type                                               | string | `"ClusterIP"`                   |             |

---

Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
