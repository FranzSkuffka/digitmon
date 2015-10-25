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
Levels.insert
    title: 'All your Rebase are belong to us'
    description: 'Combine two branches without merge'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'In A Beautiful Place Out In The Country'
    description: 'Add a remote repository and push the demo branch'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'Check this out'
    description: 'Prepare and switch to a different version of your codebase'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'How are you'
    description: 'inspect and clean your repository'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'Garbage man'
    description: 'remove your temporary files from the repo including history'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'All your Rebase are belong to us'
    description: 'Combine two branches without merge'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'In A Beautiful Place Out In The Country'
    description: 'Add a remote repository and push the demo branch'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'Check this out'
    description: 'Prepare and switch to a different version of your codebase'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'How are you'
    description: 'inspect and clean your repository'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
Levels.insert
    title: 'Garbage man'
    description: 'remove your temporary files from the repo including history'
    briefing: 'Start tracking the existing codebase in git'
    steps: initRepo
