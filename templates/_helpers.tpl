# bear-echo/charts/templates/_helpers.tpl

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "app.labels.odoo" -}}
app.kubernetes.io/name: "app-{{ .Chart.Name }}"
app.kubernetes.io/instance: "app-{{ .Release.Name }}"
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "app.chart" . }}

{{- end -}}

{{/*
Selector labels
*/}}
{{- define "app.selector.odoo" -}}
app.kubernetes.io/name: "app-{{ .Chart.Name }}"
app.kubernetes.io/instance: "app-{{ .Release.Name }}"
{{- end -}}

{{/*
Common labels
*/}}

{{- define "app.labels.db" -}}
app.kubernetes.io/name: "db-{{ .Chart.Name }}"
app.kubernetes.io/instance: "db-{{ .Release.Name }}"
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "app.chart" . }}
{{- end -}}

{{/*
Selector labels
*/}}

{{- define "app.selector.db" -}}
app.kubernetes.io/name: "db-{{ .Chart.Name }}"
app.kubernetes.io/instance: "db-{{ .Release.Name }}"
{{- end -}}
