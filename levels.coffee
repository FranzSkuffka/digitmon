init = 'git init'
add = 'add .'
noRepository = 'not a git repository'

console.log 'loading levels'
@initRepo = [
        action: 'init'

        # transitions: []
        observations:
            status: noRepository
            diff: noRepository
    ,
        action: 'add .' #extend model for parameters
        transitions: []
        observations:
            status: 'untracked: index.html'
            diff: 'diff of index.html'
    ,
        action: 'commit -m "init, add website"'
        transitions: []
        alternativeActions: [
            
        ]
        observations:
            status: 'staged: index.html, no untracked' # extend for different statuses
            diff: ''
    ,
        action: 'push'
        transitions: []
        observations:
            status: 'staged: index.html, no untracked' # extend for different statuses
            diff: ''
    ]
