class @Game
    constructor: (@level) ->
        # initialize game with level steps
        console.log @level.steps
        @state = new GameState @level.steps
        @briefing = @level.briefing
        @title = @level.title

        # retrieve all actions from level
        @actions = []
        for solution in @state.getAllSolutions()
            @actions.push new Command solution.commandType

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
