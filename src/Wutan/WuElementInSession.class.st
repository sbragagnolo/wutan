"
I represent a menu exercise which is included in an ongoing session. 
I manage the status of done of the exercise and manage the performance scoring of the exercise. 
"
Class {
	#name : #WuElementInSession,
	#superclass : #Object,
	#instVars : [
		'elementInMenu',
		'status',
		'score'
	],
	#category : #'Wutan-Model'
}

{ #category : #initialization }
WuElementInSession >> elementInMenu: anElement [

	elementInMenu := anElement.

]

{ #category : #initialization }
WuElementInSession >> perform [

	elementInMenu duration wait
]
