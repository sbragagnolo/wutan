"
I describe a training set of exercises. 
I can be played multiple times.
"
Class {
	#name : #WuTrainingMenu,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Wutan-Model'
}

{ #category : #adding }
WuTrainingMenu >> addMenuElement: aWuElementInMenu [

	elements add: aWuElementInMenu
]

{ #category : #accessing }
WuTrainingMenu >> duration [

	^ ((elements collect: [ :e | e duration ])
		   ifEmpty: [ 0 ]
		   ifNotEmpty: [ :col | col sum ]) asSeconds
]

{ #category : #accessing }
WuTrainingMenu >> elements [
	^ elements
]

{ #category : #enumerating }
WuTrainingMenu >> initialize [

	super initialize.
	elements := OrderedCollection new
]

{ #category : #'instance creation' }
WuTrainingMenu >> newSession [

	^ WuTrainingSession new
		  menu: self;
		  yourself
]

{ #category : #enumerating }
WuTrainingMenu >> thenDo: anInteger of: aWuExercise [

	self addMenuElement: (aWuExercise menuFor: anInteger)
]
