Class {
	#name : #WuExercisePage,
	#superclass : #WuMenuNavigatablePage,
	#category : #Wutan
}

{ #category : #accessing }
WuExercisePage class >> pageName [

	^ #'Manage exising exercises'
]

{ #category : #initialization }
WuExercisePage >> defaultPage [

	^ WuContactPage
]

{ #category : #initialization }
WuExercisePage >> menuComponents [

	^ { (#Contact -> WuContactPage) } asDictionary 
]
