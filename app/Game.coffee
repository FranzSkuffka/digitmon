class @Level
    constructor: (currentLevel) ->
        # initialize game with level
        @state = new GameState currentLevel

        # retrieve all actions from currentLevel
        @actions = []
        for solution in @state.getAllSolutions()
            @actions.push new Command solution.type

    performAction: (action) ->
        console.log 'performing action'
        console.log action
        if _.isEqual action, @state.get().solution
            console.log 'is match'
            return @state.next()
        console.log 'is lost'
        @state = 'lost'

    getState: -> @currentState

    getActions: -> @actions
