"
Water horse, 120@130 extent
"
Class {
	#name : 'WaterHorse',
	#superclass : 'B5Image',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#instVars : [
		'hooverDsp'
	],
	#classInstVars : [
		'hooverDsp'
	],
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'positioning' }
WaterHorse >> decrementPositionX [

	self positionX: self position x - 10
]

{ #category : 'positioning' }
WaterHorse >> incrementPositionX [

	self positionX: self position x + 10
]

{ #category : 'initialization' }
WaterHorse >> initialize [

	super initialize.
	self
		fromFilePath:
			'/Users/domenicocipriani/MyStuff/coding/pbpistolero/horse.png';
		position: 930 @ 150.
	self onClickFocus.
	self initializeDsp.
	self initializeEvents.
	hooverDsp start.
]

{ #category : 'initialization' }
WaterHorse >> initializeDsp [

	| sampler sampler2 effect |
	sampler := TpSampler new
		           label: 'horse';
		           pathToFile:
			           '/Users/domenicocipriani/MyStuff/coding/pbpistolero/nitrito.wav'.
	sampler2 := TpSampler new
		            label: 'hoover';
		            pathToFile:
			            '/Users/domenicocipriani/MyStuff/coding/pbpistolero/hooverX.wav'.
	effect := FreeverbMono new.
	hooverDsp := (sampler + sampler2 => effect)  stereo asDsp.
	hooverDsp init.
	hooverDsp setValue: 0 parameter: 'hooverTrigger'
]

{ #category : 'initialization' }
WaterHorse >> initializeEvents [

	| note |
	note := 62.
	self onKeyDownNamed: #LEFT do: [
			hooverDsp playNote: note prefix: 'horse' dur: 0.6.
			self decrementPositionX.
			note := note - 1 ].


	self onKeyDownNamed: #RIGHT do: [
			hooverDsp playNote: note prefix: 'hoover' dur: 2.
			note := 60.
			self incrementPositionX ].
			self onKeyDownNamed: #DOWN do: [
			hooverDsp playNote: 63 prefix: 'hoover' dur: 3.
			note := 60.
			self extent: 0@0 ]
]
