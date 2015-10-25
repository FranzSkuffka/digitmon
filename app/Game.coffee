class @Game
    constructor: (@level) ->
        # initialize game with level steps
        @state = new GameState @level.steps
        @briefing = @level.briefing
        @title = @level.title

        # retrieve all actions from level
        @actions = []
        for solution in @state.getAllSolutions()
            @actions.push new Command solution.commandType

    performAction: (action) ->
        if _.isEqual action, @state.currentStep.solution
            @state.next()
            console.log @state.current
            console.log @state.level.length
            if @state.current == @state.level.length
                console.log 'GAME WON'
                @state = 'won'
            return
        else
            @state = 'lost'

    getState: -> @currentState

    getActions: -> @actions
