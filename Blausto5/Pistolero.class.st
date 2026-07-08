"
The main character, el pistolero.
"
Class {
	#name : 'Pistolero',
	#superclass : 'B5Image',
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
Pistolero >> initialize [

	super initialize.
	self fromFilePath: '/Users/domenicocipriani/MyStuff/coding/pbpistolero/swan.png'; positionY: -50.
]
