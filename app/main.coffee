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
            # retrive action type
            action.type = event.target.dataset.actiontype
            # retrieve parameters
            command = new Command action.type
            console.log command.parameters
            Session.set('showParameters', true)
            # check action 
            level.performAction(action)