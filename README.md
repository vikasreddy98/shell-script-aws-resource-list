# Shell-Script-aws-resource-list
This Script will list the Resources in a given AWS account.

## Pre-requisites

1. AWS CLI Installed
2. AWS Configured

### Install AWS CLI
#### macOS
```
brew update
brew install awscli
```

#### Linux
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**Confirm Installation** 
`aws --version`

### Configure AWS Account
```
aws configure
```
**Enter the required information when prompted**
1. `AWS Access Key ID:` Paste the Access Key ID you obtained from the IAM console.
2. `AWS Secret Access Key:` Paste the Secret Access Key. Note that for security reasons, the key will not be displayed on the screen as you type it.
3. `Default Region Name:` Enter the AWS Region you want to use by default (e.g., `us-west-2` or `eu-central-1`). This is typically the region closest to you or where your resources are located.
4. `Default Output Format:` Specify your preferred output format. Common options are `json`, `yaml`, or `text`. If left blank, json is the default.

## Usage
```
git clone https://github.com/vikasreddy98/Shell-Script-aws-resource-list.git
cd Shell-Script-aws-resource-list
chmod a+x aws-resource-list.sh
```
**Run the script**
```
./aws-resource-list <region> <service_name>
```
