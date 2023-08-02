Class {
	#name : #WuSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent'
	],
	#category : #Wutan
}

{ #category : #accessing }
WuSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
WuSession >> rootComponent: anObject [
	rootComponent := anObject
]
