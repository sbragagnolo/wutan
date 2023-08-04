Class {
	#name : #WuLearningElement,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'measuringStrategy'
	],
	#category : #'Wutan-Model'
}

{ #category : #accessing }
WuLearningElement >> content [

	^ self subclassResponsibility 
]

{ #category : #accessing }
WuLearningElement >> id [

	^ id
]

{ #category : #accessing }
WuLearningElement >> id: anObject [

	id := anObject
]

{ #category : #initialization }
WuLearningElement >> initialize [

	super initialize.
	id := UUIDGenerator next
]

{ #category : #accessing }
WuLearningElement >> measuringStrategy [

	^ measuringStrategy
]

{ #category : #accessing }
WuLearningElement >> measuringStrategy: anObject [

	measuringStrategy := anObject
]

{ #category : #'as yet unclassified' }
WuLearningElement >> menuFor: anInteger [

	^ WuElementInMenu new
		  element: self;
		  amount: anInteger;
		  yourself
]

{ #category : #accessing }
WuLearningElement >> title [

	^ title
]

{ #category : #accessing }
WuLearningElement >> title: aString [

	title := aString
]
