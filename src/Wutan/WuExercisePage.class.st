Class {
	#name : #WuExercisePage,
	#superclass : #WuMenuNavigatablePage,
	#category : #'Wutan-Components'
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

	^ {
		  (#Contact -> WuTrainingSessionPage).
		  (#Editor -> WuExerciseEditor) } asOrderedDictionary 
]
