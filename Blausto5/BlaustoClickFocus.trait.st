"
Request focus on click
"
Trait {
	#name : 'BlaustoClickFocus',
	#category : 'Blausto5-Traits',
	#package : 'Blausto5',
	#tag : 'Traits'
}

{ #category : 'api - focus' }
BlaustoClickFocus >> onClickFocus [

	self onMouseClick: [ :x : y| self requestFocus ]
]

{ #category : 'api - focus' }
BlaustoClickFocus >> onDragFocus [

	self onMouseDragged: [ :evt | self requestFocus ]
]
