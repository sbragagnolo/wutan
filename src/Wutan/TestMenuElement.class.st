Class {
	#name : #TestMenuElement,
	#superclass : #TestCase,
	#instVars : [
		'exercise'
	],
	#category : #'Wutan-Tests'
}

{ #category : #running }
TestMenuElement >> setUp [

	super setUp.
	exercise := WuExercise new.
	
]

{ #category : #running }
TestMenuElement >> testMenuProducesMenuElement [

	self assert: (exercise menuFor: 40) species equals: WuElementInMenu
]

{ #category : #running }
TestMenuElement >> testMenuProducesMenuElementWithGivenAmount [

	self assert: (exercise menuFor: 40) amount equals: 40
]

{ #category : #running }
TestMenuElement >> testMenuProducesMenuElementWithItSelf [

	self assert: (exercise menuFor: 40) element equals: exercise
]
