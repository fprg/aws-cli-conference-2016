#!/bin/sh
source ./option.sh

echo "|TagName|InstanceId|InstanceType|AZ|PublicDnsName|PublicIpAddress/ElasticIP|PrivateIpAddress|EC2Role|備考|h"
aws ec2 describe-instances --profile=${PROFILE} --region=${REGION} \
--query="Reservations[].Instances[].\
{TagName: Tags[?Key==\`Name\`].Value|[0], \
InstanceId: InstanceId, \
InstanceType: InstanceType, \
AZ: Placement.AvailabilityZone, \
PublicDnsName: PublicDnsName, \
IpAddress: PublicIpAddress, \
PrivateIpAddress: PrivateIpAddress, \
State: State.Name, \
KeyName: KeyName, \
EC2Role: IamInstanceProfile.Arn \
}"|jq -r 'sort_by(.TagName)|.[]|select(.State == "running")|@text "|\(.TagName)|\(.InstanceId)|\(.InstanceType)|\(.AZ)|\(.PublicDnsName)|\(.PublicIpAddress)|\(.PrivateIpAddress)|\(.EC2Role)||"'|sed "s/arn:.*\///"|sed "s/null//g"
