currentEnemy = initRepo
state = new GameState currentEnemy

if Meteor.isClient
    Template.overlayStatus.helpers
        status: ->
            Session.get('status')
    Template.actionsMutation.helpers
        action: ->
            state.get().action
    Template.actionsWrap.events
        'click button': ->
            state.next()
            Session.set('status', state.get().observations.status)
