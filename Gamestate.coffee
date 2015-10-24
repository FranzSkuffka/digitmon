class @GameState

    constructor: (@states, @inputs, @output, @transitions) ->
        @current = 0

    get: ->
        if @states[@current]?
            return @states[@current]
        return 'tamed'
    next: -> @current++
    getAllTransitions: ->
        console.log transitions for transition in step.transitions for step in @states
        console.log step.transitions for step in @states
    #mutate: (t

