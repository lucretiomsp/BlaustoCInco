"
DSP with a TpSampler and a scratch sound for the Gun being dragged
"
Class {
	#name : 'ScratchGun',
	#superclass : 'Object',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#instVars : [
		'sampler'
	],
	#category : 'Blausto5-losSonidos',
	#package : 'Blausto5',
	#tag : 'losSonidos'
}

{ #category : 'initialization' }
ScratchGun >> initialize [

	super initialize.
	sampler := TpSampler new
		           label: 'scratchGun';
		           pathToFile:
			           '/Users/domenicocipriani/MyStuff/coding/pbpistolero/scratch1.wav'.
	^ sampler stereo asDsp
]
