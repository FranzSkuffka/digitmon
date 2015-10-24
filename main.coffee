# todos
# get all actions
# render buttons
# add win/lose states
# create fight ui


state = new GameState initRepo
class Game
    constructor: (currentLevel) ->
        @state = new GameState currentLevel
        @actions= @state.getAllSolutions()
    performAction: (action) ->
        console.log "performAction"
        console.log _()
        if _.isMatch(action, @state.getSolution())
            console.log "is match"
            return @state.next()
        @state = lost

    getState: -> @currentState

    getActions: -> @actions

game = new Game initRepo

if Meteor.isClient
    game.performAction
        type: 'init'
            
    Template.actionsObservation.helpers
        actions:
            [
                new Command 'init'
            ]

    Template.overlayStatus.helpers
        status: ->
            Session.get('status')
    Template.actionsMutation.helpers
        actions: game.actions

    Template.actionsWrap.events
        'click button': ->
            state.next()
            Session.set('status', state.get().observations.status)

