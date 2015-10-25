game = {}
action = {}
if Meteor.isClient
    Session.set 'view', 'selection'
    Session.set 'lost', false
    Session.set 'showParameters', false

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
            Session.set 'showParameters', false
    # WON
    Template.overlayWon.helpers
        visibilityClass: ->
            console.log Session.get 'won'
            if Session.get('won') == true
                return 'is-visible'


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



    performAndUpdateGame = (action)->
        console.log 'PERFORMANDUPDATE'
        game.performAction(action)
        console.log game
        Session.set('lost', true) if game.state == 'lost'
        Session.set('won', true) if game.state == 'won'
        Session.set 'showParameters', false
    Template.actionsMutation.events
        'click .Action': ->
            action = {}
            action.commandType = event.target.dataset.actiontype
            command = new Command action.commandType
            if command.parameters?
                return Session.set('showParameters', true)
            else
                performAndUpdateGame(action)
    Template.actionsParameters.events
        'click .Action-parameterType': ->

            paramType = event.target.dataset.parametertype
            value = Template.instance().find('.Action-parameterValue').value
            action.parameters = {}
            action.parameters[paramType] = value
            console.log game
            performAndUpdateGame(action)
            Session.set('showParameters', false)

    Template.actionsParameters.helpers
        visibilityClass: ->
            if Session.get('showParameters') == true
                return 'is-visible'

        parameters: ->
            return [
                name: 'message'
            ,
                name: '_default'
            ]



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
            Session.set('won', false)
            Session.set('lost',false)
            level = Levels.findOne(@_id)
            game = new Game level
            Session.set 'view', 'level'


# OBSERVATION
    Template.overlayObservation.helpers
        status: ->
            Session.get('observation')
