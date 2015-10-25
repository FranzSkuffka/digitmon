level = new Level initRepo

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
    console.log level.actions
    Template.actionsMutation.helpers
        actions: level.actions


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
            level.performAction(action)
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
            console.log 'selecting level'
            console.log @_id
            console.log event.target
            console.log 'selected level'
            level = Levels.findOne(@_id)
            console.log 'DB ENTRY'
            console.log level
            new Level level

