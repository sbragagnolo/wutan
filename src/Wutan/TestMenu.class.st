Class {
	#name : #TestMenu,
	#superclass : #TestCase,
	#instVars : [
		'menu'
	],
	#category : #'Wutan-Tests'
}

{ #category : #running }
TestMenu >> setUp [
	super setUp. 
	menu := WuTrainingMenu new. 
]

{ #category : #running }
TestMenu >> testAddExerciseToMenuAddsMenuElement [
	| exercise | 
	exercise := WuExercise new .
	menu thenDo: 40 of: exercise.
	self assert: menu elements first  species equals: WuElementInMenu. 
]

{ #category : #running }
TestMenu >> testAddExerciseToMenuAddsMenuElementPointingToExercise [
	| exercise | 
	exercise := WuExercise new .
	menu thenDo: 40 of: exercise.
	self assert: menu elements first element equals: exercise. 
]

{ #category : #running }
TestMenu >> testAddExerciseToMenuAddsMenuElementWith40Repetitions [

	| exercise |
	exercise := WuExercise new.
	menu thenDo: 40 of: exercise.
	self assert: menu elements first amount equals: 40
]

{ #category : #running }
TestMenu >> testEmptyMenuDurationIsZero [
	 self assert: menu duration equals: 0 seconds. 
]
