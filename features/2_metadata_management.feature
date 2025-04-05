@metadata_management
Feature: A Web Application to manage project metadata
    This is the second phase. There are three phases:
    1. Develop a Python script. It read the CFn Template from the Repo (Upper-level) branch, run the template in CodeBuild instance, return the result to SNS and save to S3. Write run-log to AWS BBD or JSON file.
    2. Develop a web application (Lambda). It CURD the project metadata.
    3. Develop a script to generate the CloudFormation template. It read the project metadata from BBD or JSON, generate the CloudFormation template, and save it to S3.

    Scenario: CRUD project metadata
        Given the project metadata:
        """
        (TODO need a JSON here)
        """
        When send a put request with the above JSON as body
        Then I can get a 200 HTTP response and a new created project metadata with UUID: XXXX
        When send a get list request
        Then I can get a 200 HTTP response and a JSON list, the size should be more than 0
        When I send a get request with the UUID: XXXX
        Then I can get a 200 HTTP response and a the project metadata JSON:
        """
        (TODO need a JSON here)
        """
        When I send a post request with the UUID and the following JSON as body:
        """
        (TODO need a new JSON here)
        """
        Then I can get a 200 HTTP response with the UUID: XXXX
        When I send a delete request with the UUID: XXXX
        Then I can get a 200 HTTP response with the UUID: XXXX
    
