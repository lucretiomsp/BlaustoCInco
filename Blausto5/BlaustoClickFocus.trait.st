Trait {
	#name : 'BlaustoClickFocus',
	#category : 'Blausto5',
	#package : 'Blausto5'
}

{ #category : 'api - focus' }
BlaustoClickFocus >> onClickFocus [

	self onMouseClick: [ :x : y| self requestFocus ]
]
