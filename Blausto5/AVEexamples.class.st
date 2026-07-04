"
Set of audio visual examples for Bloc5 and Phausto
"
Class {
	#name : 'AVEexamples',
	#superclass : 'Object',
	#category : 'Blausto5',
	#package : 'Blausto5'
}

{ #category : 'example' }
AVEexamples >> catMiaoReverb [

	<script: 'self new catMiaoReverb'>
	| image space dsp |
	image := B5Image new
		         fromFilePath:
			         '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/ChuckCat.png';
		         extent: 200 @ 200;
		         position: Random new next * 400 @ (Random new next * 400).
	space := B5Space new.
	space addChild: image.
	space show.
	dsp := ((TpSampler new pathToFile:
		         '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/miaoJump.wav')
	        => GreyHole new) stereo asDsp.
	dsp init.
	dsp start.

	dsp setValue: 200 parameter: 'tpSamplerFreq'.
	dsp trig: 'tpSamplerTrigger'.
	image onMouseDragged: [ :evt |
			dsp
				setValue: (evt position y map: #( 0 600 400 50 ))
				parameter: 'tpSamplerFreq'.
			image position: evt position ].
	image onMouseDown: [ :x :y | dsp trig: 'tpSamplerTrigger' ]
]
