init = 'git init'
add = 'add .'
noRepository = 'not a git repository'

console.log 'loading levels'
@initRepo = [
        solution:
            commandType: 'init'
        observations:
            status: noRepository
            diff: noRepository
    ,
        solution:
            commandType: 'add'
            parameters:
                _default: '.'
        observations:
            status: 'untracked: index.html'
            diff: 'diff of index.html'
    ,
        solution:
            commandType: 'commit'
            parameters:
                [
                    message: 'commit -m "init, add website"'
                ]

        observations:
            status: 'staged: index.html, no untracked' # extend for different statuses
            diff: ''
    ]


