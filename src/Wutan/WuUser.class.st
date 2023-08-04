"
I represent a user tracing the sessions done to the moment. 
"
Class {
	#name : #WuUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'sessions'
	],
	#category : #'Wutan-Model'
}

{ #category : #accessing }
WuUser >> name [

	^ name
]

{ #category : #accessing }
WuUser >> name: anObject [

	name := anObject
]

{ #category : #accessing }
WuUser >> sessions [

	^ sessions
]

{ #category : #accessing }
WuUser >> sessions: anObject [

	sessions := anObject
]
