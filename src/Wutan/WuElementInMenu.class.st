"
I represent a learning element within a menu. 
In a menu we establish specific details of the menu, like the amount of repetitions. 
"
Class {
	#name : #WuElementInMenu,
	#superclass : #Object,
	#instVars : [
		'amount',
		'element'
	],
	#category : #'Wutan-Model'
}

{ #category : #accessing }
WuElementInMenu >> amount [
	^ amount
]

{ #category : #accessing }
WuElementInMenu >> amount: anInteger [ 
	amount := anInteger
]

{ #category : #accessing }
WuElementInMenu >> duration [

	^ element measuringStrategy estimateDuration: amount
]

{ #category : #accessing }
WuElementInMenu >> element [
	^ element
]

{ #category : #accessing }
WuElementInMenu >> element: aWuExercise [ 
	element := aWuExercise
]

{ #category : #'instance creation' }
WuElementInMenu >> newSessionElement [

	^ WuElementInSession new
		  elementInMenu: self;
		  yourself
]

{ #category : #accessing }
WuElementInMenu >> play [

	^ element measuringStrategy play: amount
]
