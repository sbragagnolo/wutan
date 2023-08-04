Class {
	#name : #WuExercise,
	#superclass : #WuLearningElement,
	#instVars : [
		'video',
		'finishingPosture',
		'action',
		'startingPosture'
	],
	#category : #'Wutan-Model'
}

{ #category : #accessing }
WuExercise >> action [

	^ action
]

{ #category : #accessing }
WuExercise >> action: anObject [

	action := anObject
]

{ #category : #accessing }
WuExercise >> content [

	^ self startingPosture , String crlf , self action , String crlf
	  , self finishingPosture
]

{ #category : #accessing }
WuExercise >> finishingPosture [

	^ finishingPosture
]

{ #category : #accessing }
WuExercise >> finishingPosture: anObject [

	finishingPosture := anObject
]

{ #category : #accessing }
WuExercise >> startingPosture [

	^ startingPosture
]

{ #category : #accessing }
WuExercise >> startingPosture: anObject [

	startingPosture := anObject
]

{ #category : #accessing }
WuExercise >> video [

	^ video
]

{ #category : #accessing }
WuExercise >> video: anObject [

	video := anObject
]
