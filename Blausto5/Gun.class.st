"
A transparent container to change between the simple gun and the firing gun
"
Class {
	#name : 'Gun',
	#superclass : 'B5Shape',
	#traits : 'BlaustoClickFocus',
	#classTraits : 'BlaustoClickFocus classTrait',
	#instVars : [
		'gunFire',
		'gunSimple'
	],
	#category : 'Blausto5-elPistolero',
	#package : 'Blausto5',
	#tag : 'elPistolero'
}

{ #category : 'initialization' }
Gun >> initialize [

	super initialize.
	self background: Color transparent.
	self extent: 180 @ 182.
	self position: 80 @ 220.
	gunFire := GunFire new.
	gunSimple := GunSimple new.
	self addChild: gunSimple.
	self initializeEvents.
	self onClickFocus .
]

{ #category : 'initialization' }
Gun >> initializeEvents [ 

self onKeyDownNamed: #SPACE do: [ self removeChild: gunSimple. self addChild: gunFire ]
]
