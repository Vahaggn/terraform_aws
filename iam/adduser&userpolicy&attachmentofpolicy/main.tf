terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = "attachpolicyuser"
  path = "/"
}

resource "aws_iam_user_policy_attachment" "policy-attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.directPolicyUser_attach.arn
}
resource "aws_iam_policy" "directPolicyUser_attach" {
  name = "testpolicy"
  description = "A test policy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:CreatePublicKey",
                "cloudfront:UpdateKeyGroup",
                "cloudfront:ListCloudFrontOriginAccessIdentities",
                "cloudfront:ListFunctions",
                "cloudfront:ListFieldLevelEncryptionConfigs",
                "cloudfront:GetPublicKeyConfig",
                "cloudfront:GetMonitoringSubscription",
                "cloudfront:ListOriginRequestPolicies",
                "cloudfront:DeletePublicKey",
                "cloudfront:ListDistributionsByRealtimeLogConfig",
                "cloudfront:ListKeyGroups",
                "cloudfront:GetKeyGroup",
                "cloudfront:GetKeyGroupConfig",
                "cloudfront:ListResponseHeadersPolicies",
                "cloudfront:ListDistributionsByCachePolicyId",
                "cloudfront:DeleteKeyGroup",
                "cloudfront:UpdatePublicKey",
                "cloudfront:CreateMonitoringSubscription",
                "cloudfront:ListDistributionsByLambdaFunction",
                "cloudfront:GetPublicKey",
                "cloudfront:ListCachePolicies",
                "cloudfront:ListDistributionsByKeyGroup",
                "cloudfront:CreateKeyGroup",
                "cloudfront:ListPublicKeys",
                "cloudfront:ListRealtimeLogConfigs",
                "cloudfront:ListFieldLevelEncryptionProfiles",
                "cloudfront:ListDistributions",
                "cloudfront:ListStreamingDistributions",
                "cloudfront:ListDistributionsByWebACLId",
                "cloudfront:DeleteMonitoringSubscription",
                "cloudfront:ListDistributionsByResponseHeadersPolicyId",
                "cloudfront:ListDistributionsByOriginRequestPolicyId"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "cloudfront:*",
            "Resource": [
                "arn:aws:cloudfront::637680643354:field-level-encryption-profile/*",
                "arn:aws:cloudfront::637680643354:distribution/*",
                "arn:aws:cloudfront::637680643354:field-level-encryption/*",
                "arn:aws:cloudfront::637680643354:function/*",
                "arn:aws:cloudfront::637680643354:streaming-distribution/*",
                "arn:aws:cloudfront::637680643354:origin-access-identity/*",
                "arn:aws:cloudfront::637680643354:response-headers-policy/*",
                "arn:aws:cloudfront::637680643354:origin-request-policy/*",
                "arn:aws:cloudfront::637680643354:cache-policy/*",
                "arn:aws:cloudfront::637680643354:realtime-log-config/*"
            ]
        }
    ]
})
}