game = {}
if Meteor.isClient
    Session.set 'view', 'selection'
    Session.set 'lost', false
    Template.actionsObservation.helpers
        actions:
            [
                new Command 'status'
            ,
                new Command 'diff'
            ,
                new Command 'branch'
            ]

    Template.overlayObservation.helpers
        status: ->
            Session.get('observation')
    Template.actionsMutation.helpers
        actions: ->
            console.log 'retrieving actions'
            Session.get('view')
            console.log game
            game.actions if game?


    Template.actionsMutation.events
        'click .Action': ->
            action = {}
            # retrive action commandType
            action.commandType = event.target.dataset.actiontype
            console.log event.target.dataset
            # retrieve parameters
            command = new Command action.commandType
            Session.set('showParameters', true)
            # check action 
            game.performAction(action)
            Session.set('lost', true) if game.state == 'lost'
    Template.header.events
        'click .title': ->
            console.log 'return to overview'
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
            console.log 'selected level'
            level = Levels.findOne(@_id)
            console.log 'DB ENTRY'
            console.log level
            game = new Game level
            Session.set 'view', 'level'
    Template.Level.helpers
        visibilityClass: ->
            if Session.get('view') == 'level'
                console.log 'setting visibility'
                return 'is-visible'
        title: ->
            Session.get('view')
            game.title if game?
        briefing: ->
            Session.get('view')
            game.briefing if game?
    Template.overlayLost.helpers
        visibilityClass: ->
            if Session.get('lost') == true
                console.log 'setting visibility'
                return 'is-visible'



