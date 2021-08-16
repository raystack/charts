{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "meteor.name" -}}
{{- $name := default .Release.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Chart.Name $name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Build namespace, default to release's namespace
*/}}
{{- define "meteor.namespace" -}}
{{- default .Release.Namespace .Values.namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
