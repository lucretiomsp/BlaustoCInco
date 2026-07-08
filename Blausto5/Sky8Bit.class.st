"
Sky 8 bit , simple.
extent 1300@400.
"
Class {
	#name : 'Sky8Bit',
	#superclass : 'B5Image',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
Sky8Bit >> initialize [

	super initialize.
		super initialize.
	self fromFilePath:
		'/Users/domenicocipriani/MyStuff/coding/pbpistolero/sky8Bit.png' 
]
