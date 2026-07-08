"
Gun and left arm from Itch.io (free)
180@182 extent
"
Class {
	#name : 'GunSimple',
	#superclass : 'B5Image',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#instVars : [
		'gunFire'
	],
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
GunSimple >> initialize [

	super initialize.
	self
		fromFilePath:
			'/Users/domenicocipriani/MyStuff/coding/pbpistolero/pistola.png';
		position: 0 @ 160.
	self initializeEvents.
	self onClickFocus
]

{ #category : 'initialization' }
GunSimple >> initializeEvents [

	self onKeyDownNamed: #SPACE do: [ self positionY: 120 ].
	self onKeyUpNamed: #SPACE do: [ self positionY: 160 ]
]
