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

	| sampler1 sampler2 instrument eco effect |
	super initialize.
	sampler1 := TpSampler new
		            label: 'scratchGun';
		            pathToFile:
			            '/Users/domenicocipriani/MyStuff/coding/pbpistolero/scratch1.wav'.
	sampler2 := TpSampler new
		            label: 'gunLoops';
		            pathToFolder:
			            '/Users/domenicocipriani/MyStuff/samples/utrechtLoops'.
			eco := PhEcho new.
	effect := DryWetMonoMixer  new wetAmount: 0.3; fx: eco.
	instrument := (sampler1 + sampler2) =>effect.
	^ instrument stereo asDsp.
]
