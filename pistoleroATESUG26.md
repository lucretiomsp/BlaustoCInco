```smalltalk
PortMidi traceAllDevices .
mout := MIDISender  new.
mout openWithDevice: 3.
startNote := 36.
ccValue := 0.
mout sendCC: 50 withValue:  100 onChannel: 1



mexican := TpSampler new pathToFile: '/Users/domenicocipriani/MyStuff/coding/pbpistolero/theMexican.wav'; label: 'mexican'.
dsp := mexican stereo asDsp.
dsp init.
dsp start.

space := B5Space new extent: 1300@300.
space show.
farWest := B5Image new fromFilePath: '/Users/domenicocipriani/MyStuff/coding/pbpistolero/elFarWest.png'.
space addChild: farWest.
farWest  position: 0@(-150).

space onKeyDown: [ :evt | evt name traceCr ].
space onKeyDownNamed: #RIGHT do: [ mout playNote: startNote onChannel: 1 . startNote  := startNote + 1].

pistola := B5Image new fromFilePath: '/Users/domenicocipriani/MyStuff/coding/pbpistolero/pistola.png'.
space addChild: pistola.
pistola position: 0@120.
```





``
