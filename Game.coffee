class @Level
    constructor: (currentLevel) ->
        # initialize game with level
        @state = new GameState currentLevel

        # retrieve all actions from currentLevel
        @actions = []
        for solution in @state.getAllSolutions()
            @actions.push new Command solution.type
        if Meteor.isClient
            Session.set('view','level')

    lose: ->
        Session.set('lost','true')
    restart: ->

    performAction: (action) ->
        console.log 'performing action'
        console.log action
        if _.isEqual action, @state.get().solution
            console.log 'is match'
            return @state.next()
        @lose()

    getState: -> @currentState

    getActions: -> @actions