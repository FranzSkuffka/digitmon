@Levels = new Mongo.Collection("Levels")

@Schemas = {}

Schemas.Level = new SimpleSchema
    title:
        type: String
        label: 'Title'
    description:
        type: String
        label: 'Description'
        optional: true
    briefing:
        type: String
        label: 'Briefing'
        optional: true
    steps:
        type: [
            commandType: String
            params: Object
        ]

Levels.remove({})
Levels.insert
    title: 'InitThis!'
    description: 'Init repo and add codebase'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
