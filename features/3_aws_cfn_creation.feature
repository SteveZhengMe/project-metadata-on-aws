@aws_cfn_creation
Feature: Generate AWS CloudFormation template
    This is the last phase. There are three phases:
    1. Develop a Python script. It read the CFn Template from the Repo (Upper-level) branch, run the template in CodeBuild instance, return the result to SNS and save to S3. Write run-log to AWS BBD or JSON file.
    2. Develop a web application (Lambda). It CURD the project metadata.
    3. Develop a script to generate the CloudFormation template. It read the project metadata from BBD or JSON, generate the CloudFormation template, and save it to S3.

    Scenario: Generate a CloudFormation template for a project
        Given I have the following project metadata:
        | Project name      | P_1         | P_2 |
        | XXX               | XXX         | XXX |
        When I generate the CloudFormation template
        Then the template should be:
        """
        [The Cfn Template]
        """
    
    Scenario: Generate a CloudFormation template based on a project UUID
        Given I have the following project UUID XXXXX
        When I generate the CloudFormation template
        Then the project information is retrieved, the project name should be "XXXX"
        And the template should be:
        """
        [The Cfn Template]
        """