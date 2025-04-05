@execute_cfn
Feature: Script to execute CloudFormation template
    This is the first phase. There are three phases:
    1. Develop a Python script. It read the CFn Template from the Repo (Upper-level) branch, run the template in CodeBuild instance, return the result to SNS and save to S3. Write run-log to AWS BBD or JSON file.
    2. Develop a web application (Lambda). It CURD the project metadata.
    3. Develop a script to generate the CloudFormation template. It read the project metadata from BBD or JSON, generate the CloudFormation template, and save it to S3.

    @clear_infra_for_test
    Scenario: Execute CloudFormation template in CodeBuild
        Given A Git branch change event
        When there is a manifest JSON file
        Then the CFn template mentioned in the manifest JSON file should exist in S3 bucket
        And the CFn template should be executed in CodeBuild instance, the infrastructure should be created
        | Resource name | Resource type|
        | XXX           | XXX          |
        
    
