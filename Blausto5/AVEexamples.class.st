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
AVEexamples >> catJumpOnSpaceBar [

	<script: 'self new catJumpOnSpaceBar'>
	| y velY jumping gravity jumpForce groundY player space dsp street plant skyLine |
	y := 350.
	velY := 0.
	jumping := false.
	gravity := 0.5.
	jumpForce := -16.
	groundY := 350.

	"DSP"

	dsp := ((TpSampler new pathToFile:
		         '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/miaoJump.wav')
	        => FreeverbMono new) stereo asDsp.
	dsp init.
	dsp start.
skyLine := B5Image new fromFilePath: '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/clouds.png' ;
position: 0@(-300).
	street := B5Image new
		          fromFilePath:
			          '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/backgroundStreet.png';
		          position: 0 @ -140.

	plant := B5Image new
		         fromFilePath:
			         '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/plant1_small.png';
		         position: 450 @ 350.
	player := B5Image new
		          fromFilePath:
			          '/Users/domenicocipriani/MyStuff/coding/chucK/chuGL/assets/ChuckCatSmall.png';
		          position: 10 @ 300.
	space := B5Space new.
	space addChild: skyLine.
	space addChild: street.
	space addChild: player.
	space addChild: plant.
	

	player onKeyDown: [ :key |
			(key name = #SPACE and: [ jumping not ]) ifTrue: [
					dsp playNote: 50 prefix: 'tpSampler' dur: 0.2.
					velY := jumpForce.
					jumping := true ] ].

	space drawAnimation: [
			velY := velY + gravity.
			y := y + velY.
			y >= groundY ifTrue: [
					y := groundY.
					velY := 0.
					jumping := false ].
			player position: 10 @ (y - 50) ].


	space show
]

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
