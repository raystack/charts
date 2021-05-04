{{- define "raccoon.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "raccoon.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "raccoon.telegraf.conf" }}
[global_tags]
  app = "{{ include "raccoon.fullname" . }}"
[agent]
  collection_jitter = "0s"
  debug = false
  flush_interval = "10s"
  flush_jitter = "0s"
  interval = "10s"
  logfile = ""
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  omit_hostname = false
  precision = ""
  quiet = false
  round_interval = true
{{- if .Values.telegraf.config.output.influxdb.enabled }}
[[outputs.influxdb]]
  urls = {{ toJson .Values.telegraf.config.output.influxdb.urls }}
  database = "{{ .Values.telegraf.config.output.influxdb.database }}"
  retention_policy = "{{ .Values.telegraf.config.output.influxdb.retention_policy }}"
  write_consistency = "any"
  timeout = "5s"
{{- end }}
[[inputs.statsd]]
  allowed_pending_messages = 10000
  delete_counters = true
  delete_gauges = true
  delete_sets = true
  delete_timings = true
  metric_separator = "."
  parse_data_dog_tags = true
  percentile_limit = 1000
  percentiles = [
    50,
    95,
    99
  ]
  service_address = ":8125"
{{- end }}
