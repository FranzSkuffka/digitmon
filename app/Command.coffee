commandsLibrary =
    init:
        description: 'Start new git repository in current folder'
    commit:
        description: 'Save added changes as new entry in git log'
    add:
        description: 'Add changes that should be committed'
        parameters:
            'message': 'string'
    status:
        description: 'show what is going on in a repo'
    branch:
        description: 'show what is going on in a repo'
    diff:
        description: 'show what is going on in a repo'


class @Command
    constructor: (@type) ->
        console.log @type
        @description = commandsLibrary[@type].description
        @parameters = commandsLibrary[@type].parameters


