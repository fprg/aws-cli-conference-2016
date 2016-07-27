#!/bin/sh
source ./option.sh

aws ec2 describe-volumes --profile=${PROFILE} --region=${REGION} \
--query="Volumes[].{VolumeId: VolumeId, State: State, Size: Size, SnapshotId: SnapshotId, CreateTime: CreateTime}" \
--filters="Name=status,Values=available" --output=table
