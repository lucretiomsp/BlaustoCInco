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
	self onClickFocus
]

{ #category : 'initialization' }
Gun >> initializeDsp [ 

gunDsp := ScratchGun new.
gunDsp init.
gunDsp start.
]

{ #category : 'initialization' }
Gun >> initializeEvents [

| samplesArray |
samplesArray := 11.
	self onKeyDownNamed: #SPACE do: [ self positionY: 120. gunDsp trig: 'gunSamplerTrigger'. 
		gunDsp setValue: (samplesArray wrap: 11) parameter: 'gunSamplerIndex'.
		 ].
	self onKeyUpNamed: #SPACE do: [ self positionY: 160 ]
]
