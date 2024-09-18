import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import * as secretsmanager from '@aws-cdk/aws-secretsmanager';
import * as ssm from '@aws-cdk/aws-ssm';
import * as apigateway from '@aws-cdk/aws-apigateway';

export class CdkLambdaSetupStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Create Secret for DB credentials
    const dbSecret = secretsmanager.Secret.fromSecretNameV2(this, 'DBSecret', 'prod/dbCredentials');

    // Create Lambda Function
    const lambdaFunction = new lambda.Function(this, 'AppFunction', {
      runtime: lambda.Runtime.NODEJS_14_X,
      code: lambda.Code.fromAsset('lambda'),
      handler: 'handler.main',
      environment: {
        DATABASE_HOST: '127.0.0.1',
        DATABASE_NAME: 'test',
        DB_SECRET_ARN: dbSecret.secretArn,
      },
    });

    // Grant Lambda permissions to read the secret
    dbSecret.grantRead(lambdaFunction);

    // API Gateway to trigger Lambda
    const api = new apigateway.LambdaRestApi(this, 'Endpoint', {
      handler: lambdaFunction,
    });

    new cdk.CfnOutput(this, 'API Gateway URL', {
      value: api.url,
    });
  }
}
