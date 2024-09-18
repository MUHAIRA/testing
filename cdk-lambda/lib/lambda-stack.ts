import { Construct } from 'constructs';
import { Stack, StackProps } from 'aws-cdk/core';
import { Function, Runtime } from 'aws-cdk/aws-lambda';

export class MyStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

    const myFunction = new Function(this,   
 'MyFunction', {
      runtime: Runtime.NODEJS_14_X,
      handler: 'index.handler',
      code: Code.fromAsset('lambda')
    });
  }
}
