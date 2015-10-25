game = {}
if Meteor.isClient
    Session.set 'view', 'selection'
    Session.set 'lost', false

    # LEVEL
    Template.Level.helpers
        visibilityClass: ->
            if Session.get('view') == 'level'
                return 'is-visible'
        title: ->
            Session.get('view')
            game.title if game?
        briefing: ->
            Session.get('view')
            game.briefing if game?
    # LOST
    Template.overlayLost.helpers
        visibilityClass: ->
            if Session.get('lost') == true
                return 'is-visible'
    Template.overlayLost.events
        'click .Retry': ->
            # restart game
            game = new Game game.level
            Session.set 'lost', false


    # ACTIONS
    Template.actionsObservation.helpers
        actions:
            [
                new Command 'status'
            ,
                new Command 'diff'
            ,
                new Command 'branch'
            ]

    Template.actionsMutation.helpers
        actions: ->
            Session.get('view')
            game.actions if game?


    Template.actionsMutation.events
        'click .Action': ->
            action = {}
            # retrive action commandType
            action.commandType = event.target.dataset.actiontype
            # retrieve parameters
            command = new Command action.commandType
            Session.set('showParameters', true)
            # check action
            game.performAction(action)
            Session.set('lost', true) if game.state == 'lost'

    # LEVEL SELECTION
    Template.header.events
        'click .title': ->
            Session.set('view', 'selection')
    Template.levelSelection.helpers
        levels: ->
            Levels.find()
        visibilityClass: ->
            if Session.get('view') == 'selection'
                return 'is-visible'
    Template.LevelSummary.events
        'click .LevelSummary': ->
            Session.set('lost',false)
            level = Levels.findOne(@_id)
            game = new Game level
            Session.set 'view', 'level'


# OBSERVATION
    Template.overlayObservation.helpers
        status: ->
            Session.get('observation')
