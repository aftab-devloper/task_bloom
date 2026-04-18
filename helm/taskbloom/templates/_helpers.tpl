{{- define "taskbloom.name" -}} 
{{- .Chart.Name }} 
{{- end }} 
 
{{- define "taskbloom.fullname" -}} 
{{- printf "%%s-%%s" .Release.Name .Chart.Name }} 
{{- end }} 
