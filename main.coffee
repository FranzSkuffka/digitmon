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
    getState: -> @currentState

    getActions: -> @actions

game = new Game initRepo

if Meteor.isClient
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
