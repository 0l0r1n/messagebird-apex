# SFDX  App

MessageBird REST API for Salesforce, built using SFDX

## Please note that this is not an official supported version by MessageBird

This is just me on my free time, having some fun :)

## Requirements

- Sign up for a free MessageBird account
- Create a new access_key in the developers section
- SalesforceDX cli installed

## Installation

### DX

    git clone https://github.com/0l0r1n/messagebird-apex
    cd messagebird-apex

To create a new scratch org with the configuration:

    sfdx force:org:create -s -f config/project-scratch-def.json -a "messagebird-tests"
    sfdx force:source:push
    sfdx force:org:open

### Metadata API
To convert the source to use the metadata api for a sandbox or production:

    sfdx force:source:convert -d mdapi_output_dir/ --packagename package_name

Then you will be able to use ant (or any automated tool) to run your deployment



