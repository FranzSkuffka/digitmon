# todos
# get all actions
# render buttons
# add win/lose states
# create fight ui


state = new GameState initRepo
class Game
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

game = new Game initRepo

if Meteor.isClient
    Template.actionsObservation.helpers
        actions:
            [
                new Command 'status'
            ,
                new Command 'diff'
            ,
                new Command 'branch'
            ]

    Template.overlayStatus.helpers
        status: ->
            Session.get('status')
    console.log game.actions
    Template.actionsMutation.helpers
        actions: game.actions


    Template.actionsMutation.events
        'click button': ->
            action = {}
            # retrive action type
            action.type = event.target.dataset.actiontype
            # retrieve parameters
            command = new Command action.type
            console.log command.parameters
            Session.set('showParameters', true)
            # check action 
            game.performAction(action)
