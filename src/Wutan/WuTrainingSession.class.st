"
I represent an on going training session.
I respond to a menu of exercises. 
I trace the current status.

"
Class {
	#name : #WuTrainingSession,
	#superclass : #Object,
	#instVars : [
		'menu',
		'current',
		'elements',
		'status'
	],
	#category : #'Wutan-Model'
}

{ #category : #accessing }
WuTrainingSession >> elements [
	^ elements
]

{ #category : #testing }
WuTrainingSession >> isFinished [

	^ status == #Finished
]

{ #category : #accessing }
WuTrainingSession >> isReady [

	^ status == #Ready
]

{ #category : #accessing }
WuTrainingSession >> menu: aWuTrainingMenu [

	menu := aWuTrainingMenu.
	elements := aWuTrainingMenu elements collect: [ :el |
		            el newSessionElement ].
	self setAsReady. 
]

{ #category : #accessing }
WuTrainingSession >> nextElement [

	^ current next
]

{ #category : #accessing }
WuTrainingSession >> setAsFinished [

	^ status := #Finished
]

{ #category : #accessing }
WuTrainingSession >> setAsReady [

	^ status := #Ready
]

{ #category : #accessing }
WuTrainingSession >> start [

	self assert: self isReady.
	[
	current := elements readStream.
	[ self thereIsNextElement ] whileTrue: [ self nextElement perform ].
	self setAsFinished ] schedule
]

{ #category : #'as yet unclassified' }
WuTrainingSession >> thereIsNextElement [

	^ current atEnd
]
