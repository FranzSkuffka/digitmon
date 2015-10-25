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
        description: 'Show changed files and differences from remote'
    branch:
        description: 'show working versions of your repository'
    diff:
        description: 'Show exact changes inside files'


class @Command
    constructor: (@commandType) ->
        @description = commandsLibrary[@commandType].description
        @parameters = commandsLibrary[@commandType].parameters


