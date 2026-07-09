"
Gun and left arm from Itch.io (free)
180@182 extent
"
Class {
	#name : 'Gun',
	#superclass : 'B5Image',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#instVars : [
		'gunFire',
		'gunDsp'
	],
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
Gun >> initialize [

	super initialize.
	self
		fromFilePath:
			'/Users/domenicocipriani/MyStuff/coding/pbpistolero/pistola.png';
		position: 0 @ 160.
	self initializeEvents.
	self onClickFocus.
	self initializeDsp.
]

{ #category : 'initialization' }
Gun >> initializeDsp [ 

gunDsp := ScratchGun new.
gunDsp init.
gunDsp start.
]

{ #category : 'initialization' }
Gun >> initializeEvents [

	| samplesArray indx |
	samplesArray := (0 to: 10) asArray.
	indx := 1.
	self onKeyDownNamed: #SPACE do: [
			self positionY: 120.
			gunDsp trig: 'gunLoopsTrigger' .
			indx == 11 ifTrue: [  self parent addChild: Sky8Bit new at: 1. (self parent children at: 2 ) zIndex:  -1]
			].
	self onKeyUpNamed: #SPACE do: [
			self positionY: 160.
			gunDsp
				setValue: (samplesArray wrap: indx)
				parameter: 'gunLoopsIndex'.
			indx := indx + 1 ].

	self onMouseDragged: [ :evt |
			gunDsp setValue: evt position x parameter: 'scratchGunFreq'.
			gunDsp trig: 'scratchGunTrigger'.
			self positionX: evt position x ]
]
