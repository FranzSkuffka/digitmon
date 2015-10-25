if Meteor.isClient
    Template.levelSelection.helpers
        visibilityClass: ->
            if Session.get('view') == 'selection'
                return 'is-visible'
            return ''
    Template.levelSelection.events
        'click .LevelSummary': ->
            console.log event.target
