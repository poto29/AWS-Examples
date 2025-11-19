import { Stack, StackProps } from 'aws-cdk-lib/core';
import * as S3 from 'aws-cdk-lib/aws-s3';
import { Construct } from 'constructs';

export class CdkStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);
    new S3.Bucket(this, "my-first-bucket-with-cdk-1231");
  }
}
