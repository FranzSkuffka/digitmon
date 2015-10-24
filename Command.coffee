commandsLibrary = [
    init:
        description: 'Start new git repository in current folder'
    commit:
        description: 'Save added changes as new entry in git log'
    add:
        description: 'Add changes that should be committed'
]

class @Command
    constructor: (@type) ->
    getDescription: -> commandsLibrary[@type]


