init = 'git init'
add = 'add .'
noRepository = 'not a git repository'

console.log 'loading levels'
@initRepo = [
        solution:
            type: 'init'
        observations:
            status: noRepository
            diff: noRepository
    ,
        solution:
            type: 'add'
            parameters:
                _default: '.'
        observations:
            status: 'untracked: index.html'
            diff: 'diff of index.html'
    ,
        solution:
            type: 'commit'
            parameters:
                [
                    message: 'commit -m "init, add website"'
                ]

        observations:
            status: 'staged: index.html, no untracked' # extend for different statuses
            diff: ''
    ]
