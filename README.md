MessageBird Apex Library

MessageBird Wrapper Library for Salesforce, built using SFDX

## Please note that this is not an official supported version by MessageBird

This is just me on my free time, having some fun :)
Heavily based on MessageBird's own java library - https://github.com/messagebird/java-rest-api
## Requirements

- Sign up for a free MessageBird account
- Create a new access_key in the developers section
- SalesforceDX cli installed

## Installation
### DX

    git clone https://github.com/0l0r1n/messagebird-apex
    cd messagebird-apex

To create a new scratch org with the configuration:

    sfdx force:org:create -s -f config/project-scratch-def.json -a "messagebird"
    sfdx force:source:push
    sfdx force:org:open

### Metadata API
To convert the source to use the metadata api for a sandbox or production:

    sfdx force:source:convert -d mdapi_output_dir/ --packagename package_name

Then you will be able to use ant (or any automated tool) to run your deployment
## Setup

- Add new access key as custom metadata records on Key_Value_Pair__mdt records.
    - Use the label/developer name 'MB_AccessKey'

## Usage

This library current supports:

- Message API
- Voice Message API
- Balance API
- HLR API

MessageBird has an awesome API, here are a few examples of what you can do:

The MB_MessageBirdService class contain the methods you need to call the MessageBird API.
```apex
    MB_MessageBirdService messageBirdService = new MB_MessageBirdService();
```
- Sending a SMS:
```apex
    MB_Message message = new MB_Message('Ganondorf', 'I\'ve got your pretty princess, come get me', '4815162342'); // multiple constructors available
    mb.sendMessage(message);
```

- Getting your balance
```apex
    mb.getBalance();
```

- Checking a message based on id
```apex
    mb.viewMessage(MESSAGE_ID);
```


