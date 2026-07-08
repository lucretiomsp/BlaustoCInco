"
Water horse, 120@130 extent
"
Class {
	#name : 'WaterHorse',
	#superclass : 'B5Image',
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
WaterHorse >> initialize [

	super initialize.
	self fromFilePath:
		'/Users/domenicocipriani/MyStuff/coding/pbpistolero/horse.png' ; position: 930@150.
]
