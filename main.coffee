class Level
    constructor: (@gameState)
class GameState

    constructor: (@states, @inputs, @output, @transitions) ->
        @current = 0

    get: -> @states[@current]
    next: -> @current++
    getAllTransitions: ->
        console.log 'hi'
        console.log transitions for transition in step.transitions for step in @states
        console.log step.transitions for step in @states
        console.log 'past'
    #mutate: (t

init = 'git init'
add = 'add .'
noRepository = 'not a git repository'

steps = [
        action: init

        transitions: []
        observations:
            status: noRepository
            diff: noRepository
    ,
        action: 'add .' #extend model for parameters
        transitions: []
        observations:
            status: 'untracked: index.html'
            diff: 'diff of index.html'
    ,
        action: 'commit -m "init, add website"'
        transitions: []
        alternativeActions: [
            
        ]
        observations:
            status: 'staged: index.html, no untracked' # extend for different statuses
            diff: ''
    ,
        action: 'push'
        transitions: []
        observations:
            status: 'staged: index.html, no untracked' # extend for different statuses
            diff: ''
    ]
state = new GameState steps
# console.log state.get()
state.next()
# console.log state.get()

state.getAllTransitions()
