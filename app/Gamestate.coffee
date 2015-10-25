class @GameState

    constructor: (@level) ->
        @current = 0
        @currentStep = @level[@current]

    next: ->
        @current++
        if @level[@current]?
            return @currentStep = @level[@current]
        return 'tamed'
    getAllSolutions: ->
        solutions = []
        for step in @level
            solutions.push step.solution
        return solutions


