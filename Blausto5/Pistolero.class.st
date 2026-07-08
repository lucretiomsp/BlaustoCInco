"
The main character, el pistolero.
"
Class {
	#name : 'Pistolero',
	#superclass : 'B5Image',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#instVars : [
		'fm',
		'fmNote',
		'modIndex',
		'modRatio'
	],
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
Pistolero >> decrementExtent [

	self extent: (self extent - 5) @ (self extent - 5)
]

{ #category : 'positioning' }
Pistolero >> decrementPositionX [

	self positionX: self position x - 6
]

{ #category : 'initialization' }
Pistolero >> incrementExtent [

	self extent: (self extent + 5) @ (self extent + 5)
]

{ #category : 'positioning' }
Pistolero >> incrementPositionX [

	self positionX: self position x + 6
]

{ #category : 'initialization' }
Pistolero >> initialize [

	super initialize.
	self
		fromFilePath:
			'/Users/domenicocipriani/MyStuff/coding/pbpistolero/elPistolero.png';
		position: 650 @ 30.
	self initializeDsp.
	fmNote := 32.
	modIndex := 20.
	modRatio := 0.5.
	self initializeEvents.
	self onClickFocus .
]

{ #category : 'initialization' }
Pistolero >> initializeDsp [

	fm := (Fm2Op new => GreyHoleDW new) asDsp.
	fm
		init;
		start.
	fm setValue: 10 parameter: 'Fm2OpModIndex'.
	fm setValue: 1 parameter: 'Fm2OpModRatio'
]

{ #category : 'initialization' }
Pistolero >> initializeEvents [

	self onKeyDownNamed: #UP do: [
			self incrementExtent.
			modIndex := modIndex + 1 min: 90.
			fm playNote: fmNote prefix: 'fm2Op' dur: 2.
			fm setValue: modIndex parameter: 'Fm2OpModIndex' ].
	self onKeyDownNamed: #DOWN do: [
			self decrementExtent.
			modIndex := modIndex - 1 max: 1.
			fm playNote: fmNote prefix: 'fm2Op' dur: 2.
			fm setValue: modIndex parameter: 'Fm2OpModIndex' ].

	self onKeyDownNamed: #LEFT do: [
			self decrementPositionX.
			modRatio := modRatio - 0.01 max: 0.1.
			fm playNote: fmNote prefix: 'fm2Op' dur: 2.
			fm setValue: modRatio parameter: 'Fm2OpModRatio' ].
	self onKeyDownNamed: #RIGHT do: [
			self incrementPositionX.
			modRatio := modRatio + 0.01 min: 12.
			fm playNote: fmNote prefix: 'fm2Op' dur: 2.
			fm setValue: modRatio parameter: 'Fm2OpModRatio' ]
]
