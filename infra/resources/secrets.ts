import * as pulumi from '@pulumi/pulumi';
import * as aws from '@pulumi/aws';

const stack = pulumi.getStack();

export function createSecrets(provider: aws.Provider): void {
  const redisConnectionUrlSecretName = `/${stack}/shinra/resource/credentials`;

  new aws.secretsmanager.Secret(
    redisConnectionUrlSecretName,
    {
      name: redisConnectionUrlSecretName,
      description: 'Credentials for Shinra Resource',
    },
    { provider },
  );
}
