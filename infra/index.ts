import * as aws from '@pulumi/aws';
import { createBucket, createSecrets } from './resources';

const provider = new aws.Provider('privileged', {
  region: aws.config.requireRegion(),
});

createBucket(provider);
createSecrets(provider);
