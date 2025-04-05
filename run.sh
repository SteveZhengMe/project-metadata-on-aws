#! /bin/bash

# if the parameter is "execute", print "Executing...", if the parameter is "test", print "Testing..."
if [ "$1" == "execute_cfn" ]; then
    echo "========Execute CFn========"
    poetry run python src/execute_cfn.py
elif [ "$1" == "management" ]; then
    echo "========Start Metadata Management Web Server========"
    # start a hug server on the file metadata_management.py
    poetry run hug -f src/metadata_management.py
elif [ "$1" == "bdd" ]; then
    echo "========Run BDD tests========"
    if [ -z "$2" ]; then
        echo "-------Run all BDD tests-------"
        poetry run behave -f pretty
    else
        if [ "$2" == "1" ]; then
            echo "-------Run BDD tests of 1_execute_cfn.feature-------"
            # run behave test of 1_execute_cfn.feature
            poetry run behave -f pretty -t @execute_cfn --tags=@execute_cfn
        elif [ "$2" == "2" ]; then
            echo "-------Run BDD tests of 2_execute_cfn.feature-------"
            poetry run behave -f pretty -t @metadata_management --tags=@metadata_management
        elif [ "$2" == "2" ]; then
            echo "-------Run BDD tests of 3_aws_cfn_creation.feature-------"
            poetry run behave -f pretty -t @aws_cfn_creation --tags=@aws_cfn_creation
        else
            echo "Invalid parameter. Use '1', '2' or '3'."
        fi
    fi
else
    echo "Invalid parameter. Use 'execute_cfn', 'management' or 'bdd'."
fi
