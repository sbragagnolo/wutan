Class {
	#name : #TestSession,
	#superclass : #TestCase,
	#instVars : [
		'menu',
		'session'
	],
	#category : #'Wutan-Tests'
}

{ #category : #running }
TestSession >> setUp [

	super setUp.
	menu := WuTrainingMenu new.
	menu thenDo: 2 of: WuExercise new.
	session := menu newSession. 
]

{ #category : #running }
TestSession >> testSessionHasManyElementsAsMenu [

	self assert: menu elements size equals: session elements size
]

{ #category : #running }
TestSession >> testSessionIsNotFinished [

	self deny: session isFinished
]

{ #category : #running }
TestSession >> testSessionStartsFinishes2secondsAfter [

	session start.
	2 seconds wait.
	self assert: session isFinished.
]
