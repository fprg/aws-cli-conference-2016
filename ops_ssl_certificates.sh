#!/bin/sh
source ./option.sh

echo '===================='
echo 'ELB'
echo '===================='
aws elb describe-load-balancers \
--profile=${PROFILE} --region=${REGION} \
--query="LoadBalancerDescriptions[].{LoadBalancerName: LoadBalancerName, \
SSLCertificateId: ListenerDescriptions[*].Listener.SSLCertificateId}"|jq ''

echo '===================='
echo 'CloudFront'
echo '===================='
aws cloudfront list-distributions --profile=${PROFILE} \
--query="DistributionList.Items[*].{Origins: Origins.Items[].DomainName, \
ViewerCertificate: ViewerCertificate}"|jq ''

echo '===================='
echo 'IAM'
echo '===================='
aws iam list-server-certificates --profile=${PROFILE} \
--query="ServerCertificateMetadataList[].{ServerCertificateId: ServerCertificateId, \
ServerCertificateName: ServerCertificateName, \
Expiration: Expiration, Path: Path, Arn: Arn}"|jq ''
