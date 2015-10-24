class @GameState

    constructor: (@level) ->
        @current = 0

    get: ->
        if @level[@current]?
            return @level[@current]
        return 'tamed'
    next: -> @current++
    getAllSolutions: ->
        solutions = []
        for step in @level
            solutions.push step.solution
        return solutions

