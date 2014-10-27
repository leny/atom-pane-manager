_aConfigArrayItems =
    type: "integer"
    minimum: 1
    maximum: 6

module.exports =
    # Configuration settings
    config:
        layout1:
            type: "array"
            default: [ 1 ]
            items: _aConfigArrayItems
        layout2:
            type: "array"
            default: [ 1, 1 ]
            items: _aConfigArrayItems
        layout3:
            type: "array"
            default: [ 1, 1, 1 ]
            items: _aConfigArrayItems
        layout4:
            type: "array"
            default: [ 1, 1, 1, 1 ]
            items: _aConfigArrayItems
        layout5:
            type: "array"
            default: [ 2, 2 ]
            items: _aConfigArrayItems
        layout6:
            type: "array"
            default: [ 2, 2, 2 ]
            items: _aConfigArrayItems
        layout7:
            type: "array"
            default: [ 1, 2 ]
            items: _aConfigArrayItems
        layout8:
            type: "array"
            default: [ 2, 1 ]
            items: _aConfigArrayItems
        layout9:
            type: "array"
            default: [ 1, 1, 2 ]
            items: _aConfigArrayItems
        layout10:
            type: "array"
            default: [ 1, 2, 2 ]
            items: _aConfigArrayItems

    activate: ->
        console.log "do magic things here"
