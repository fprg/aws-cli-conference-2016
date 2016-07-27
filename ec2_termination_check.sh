#!/bin/sh
source ./option.sh

INSTANCE_LIST=`aws ec2 describe-instances --profile=${PROFILE} --region=${REGION} --query="Reservations[].Instances[*].InstanceId" --output=text`
INSTANCE_LIST=(${INSTANCE_LIST})
for INSTANCE_ID in "${INSTANCE_LIST[@]}"
do
  aws ec2 describe-instance-attribute --profile=${PROFILE} --region=${REGION} \
  --instance-id="$INSTANCE_ID" \
  --attribute disableApiTermination --output=table
done
