"
A transparent container to change between the simple gun and the firing gun
"
Class {
	#name : 'Gun',
	#superclass : 'B5Shape',
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
Gun >> initialize [

	super initialize.
	self background: Color transparent .
]
