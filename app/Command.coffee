commandsLibrary =
    init:
        description: 'Start new git repository in current folder'
    commit:
        parameters:[
            'message'
        ]
    add:
        description: 'Add changes that should be committed'
        parameters:[
            '_default'
        ]

    status:
        description: 'show what is going on in a repo'
    branch:
        description: 'show what is going on in a repo'
    diff:
        description: 'show what is going on in a repo'


class @Command
    constructor: (@commandType) ->
        @description = commandsLibrary[@commandType].description
        @parameters = commandsLibrary[@commandType].parameters


