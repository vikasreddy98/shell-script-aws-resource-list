#!/bin/bash

#####################################################################
# Author: Raghu Vikas Reddy Y
# Date Created: 14th Feb, 2026
# Date Modified: 01th Mar, 2026
# Versio: v1.0.2
#
# Description: This script will list the resources in the AWS account.
#
# Following are the supported AWS services by the script
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. ELB
# 8. CloudFront
# 9. CloudWatch
# 10. SNS
# 11. SQS
# 12. Route53
# 13. VPC
# 14. CloudFormation
# 15. IAM
#
# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 EC2 
######################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
	echo "Usage: $0 <region> <service_name>"
	exit 1
fi

# Convert the services to lowercase
aws_region=$(echo "$1" | tr '[:upper:]' '[:lower:]')
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
	echo "AWS CLI is not installed. Please make sure AWS CLI is installed properly."
	exit 1
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
	echo "AWS CLI is not configured. Please configure AWS CLI with your AWS Account"
	exit 1
fi 

case $aws_service in
	ec2)
		echo "Listing EC2 Instances in $aws_region"
		aws ec2 describe-instances --region $aws_region
		;;
	s3)
		echo "Listin s3 Buckets in $aws_region"
		aws s3api list-buckets --region $aws_region
		;;
	rds)
		echo "Listing RDS Instances in $aws_region"
		aws rds describe-db-instances --region $aws_region
		;;
	dynamodb)
		echo "Listing DynamoDB Tables in $aws_region"
		aws dynamo list-tables --region $aws_region
		;;
	lambda)
		echo "Listing Lambda Functions in $aws_region"
		aws lambda list-functions --region $aws_region
		;;
	ebs)
		echo "Listing EBS Volumes in $aws_region"
		aws ec2 describe-volumes --region $aws_region
		;;
	elb)
		echo "Listing ELB Load Balancers in $aws_region"
		aws elb describe-load-balancers --region $aws_Region
		;;
	cloudfront)
		echo "Listing CloudFront Distributions on $aws_region"
		aws cloudfront list-distributions --region $aws_region
		;;
	cloudwatch)
		echo "Listing CloudWatch Alarms in $aws_region"
		aws coudwatch describe-alarms --region $aws_region
		;;
	cloudformation)
		echo "Listing CloudFormation Stacks in $aws_region"
		aws cloudformation describe-stacks --region $aws_region
		;;
	sns)
		echo "Listing SNS Topics in $aws_region"
		aws sns list-queues --region $aws_region
		;;
	sqs)
		echo "Listing SQS Queues in $aws_region"
		aws sqss list-queues --region $aws_region
		;;
	route53)
		echo "Listing Route53 Hosted Zones in $aws_region"
		aws route53 list-hosted-zones --region $aws_region
		;;
	vpc)
		echo "Listing VPCs in $aws_region"
		aws ec2 describe-vpcs --region $aws_region
		;;
	iam)
		echo "Listing IAM Users in $aws_region"
		aws iam list-users --region $aws_region
		;;
	*)
		echo "Invalid service. Please enter a valid service listed in the script."
		exit 1
		;;
esac 
