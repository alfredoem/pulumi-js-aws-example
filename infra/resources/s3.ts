import * as pulumi from '@pulumi/pulumi';
import * as aws from '@pulumi/aws';

const env = new pulumi.Config('env');
const demoBucket = env.require('demoBucket');

function bucketS3(provider: aws.Provider): aws.s3.Bucket {
  return new aws.s3.Bucket(demoBucket, {bucket: demoBucket}, { provider });
}

export function createBucket(provider: aws.Provider): void {
  bucketS3(provider);
}
