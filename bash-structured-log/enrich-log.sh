#!/usr/bin/env bash

SERVICE_NAME="bash-structured-log"
TRACE_ID="00000000000000000000000000000000"
SPAN_ID="000000000000$(printf '%04x' $RANDOM)"

#NOTE: https://en.wikipedia.org/wiki/Process_substitution
#NOTE: rewrite STDOUT
exec 1> >(echo -E "{ \"traceId\": \"$TRACE_ID\", \"spanId\": \"$SPAN_ID\", \"message\": \"[$SERVICE_NAME] $(sed -z -e 's/"/\\"/g' -e 's/\n/\\n/g')\", \"attributes\": { \"service.name\": \"$SERVICE_NAME\" } }")

#NOTE: rewrite STDERR
exec 2> >(echo -E "{ \"traceId\": \"$TRACE_ID\", \"spanId\": \"$SPAN_ID\", \"message\": \"[$SERVICE_NAME] $(sed -z -e 's/"/\\"/g' -e 's/\n/\\n/g')\", \"attributes\": { \"service.name\": \"$SERVICE_NAME\" } }" >&2)


echo "log to STDOUT"
echo "log to STDERR" 1>&2
