{{- define "firehose.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "firehose.fullname" -}}
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

{{- define "firehose.telegraf.conf" }}
[global_tags]
{{- range $k, $v := .Values.telegraf.config.additional_global_tags }}
  {{ $k }} = "{{ $v }}"
{{- end }}
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
{{- if .Values.telegraf.config.output.prometheus_remote_write.enabled }}
[[outputs.http]]
  url = "{{.Values.telegraf.config.output.prometheus_remote_write.url}}"
  data_format = "prometheusremotewrite"
  [outputs.http.headers]
      {{- if .Values.telegraf.config.output.prometheus_remote_write.authorization }}
      Authorization = "{{.Values.telegraf.config.output.prometheus_remote_write.authorization}}"
      {{- end }}
      Content-Type = "application/x-protobuf"
      Content-Encoding = "snappy"
      X-Prometheus-Remote-Write-Version = "{{.Values.telegraf.config.output.prometheus_remote_write.version}}"
{{- end }}
[[inputs.statsd]]
  allowed_pending_messages = 10000
  delete_counters = true
  delete_gauges = true
  delete_sets = true
  delete_timings = true
  metric_separator = "."
  datadog_extensions = true
  percentile_limit = 1000
  percentiles = [
    50,
    95,
    99
  ]
  service_address = ":8125"
{{- if .Values.firehose.config.JAVA_TOOL_OPTIONS }}
{{- if contains "jolokia" .Values.firehose.config.JAVA_TOOL_OPTIONS }}
[[inputs.jolokia2_agent]]
  urls          = ["http://localhost:8778/jolokia"]
  name_prefix   = "firehose_"
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  mbean         = "java.lang:type=Runtime"
  paths         = ["Uptime"]
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  mbean         = "java.lang:type=Memory"
  paths         = ["HeapMemoryUsage"]
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  mbean         = "java.lang:type=Memory"
  paths         = ["NonHeapMemoryUsage"]
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  field_prefix  = "garbage_collection_"
  mbean         = "java.lang:name=*,type=GarbageCollector"
  paths         = ["LastGcInfo", "CollectionTime", "CollectionCount"]
  tag_keys      = ["name"]
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  field_prefix  = "thread_count_"
  mbean         = "java.lang:type=Threading"
  paths         = ["TotalStartedThreadCount","ThreadCount","DaemonThreadCount","PeakThreadCount"]
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  field_prefix  = "class_count_"
  mbean         = "java.lang:type=ClassLoading"
  paths         = ["LoadedClassCount","UnloadedClassCount","TotalLoadedClassCount"]
[[inputs.jolokia2_agent.metric]]
  name          = "jvm_"
  field_prefix  = "class_count_java_memory_pool_"
  mbean         = "java.lang:name=*,type=MemoryPool"
  paths         = ["Usage", "PeakUsage", "CollectionUsage"]
  tag_keys      = ["name"]
[[inputs.jolokia2_agent.metric]]
  name          = "operating_system_"
  mbean         = "java.lang:type=OperatingSystem"
  paths         = ["MaxFileDescriptorCount","ProcessCpuTime","AvailableProcessors","SystemCpuLoad","TotalSwapSpaceSize","OpenFileDescriptorCount","FreePhysicalMemorySize","CommittedVirtualMemorySize","ProcessCpuLoad","FreeSwapSpaceSize","TotalPhysicalMemorySize"]
[[inputs.jolokia2_agent.metric]]
  name          = "kafka_consumer_"
  field_prefix  = "coordinator_"
  mbean         = "kafka.consumer:type=consumer-coordinator-metrics,client-id=*"
  tag_keys      = ["client-id"]
[[inputs.jolokia2_agent.metric]]
  name          = "kafka_consumer_"
  field_prefix  = "fetch_manager_"
  mbean         = "kafka.consumer:type=consumer-fetch-manager-metrics,client-id=*"
  tag_keys      = ["client-id","topic","partition"]
[[inputs.jolokia2_agent.metric]]
  name          = "kafka_consumer_"
  field_prefix  = "metrics_"
  mbean         = "kafka.consumer:type=consumer-metrics,client-id=*"
  tag_keys      = ["client-id"]
[[inputs.jolokia2_agent.metric]]
  name = "jdbc_"
  mbean = "com.zaxxer.hikari:type=*"
{{- end }}
{{- end }}
{{- end }}
