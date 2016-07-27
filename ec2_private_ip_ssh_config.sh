#!/bin/sh
source ./option.sh

aws ec2 describe-instances --profile=${PROFILE} --region=${REGION} \
--query="Reservations[].Instances[].\
{TagName: Tags[?Key==\`Name\`].Value|[0], \
PrivateIpAddress: PrivateIpAddress, \
State: State.Name \
}"|jq -r 'sort_by(.TagName)|.[]|select(.State == "running")|@text "Host \(.TagName)\n  HostName \(.PrivateIpAddress)"'
