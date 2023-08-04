Class {
	#name : #WuPage,
	#superclass : #WuComponent,
	#category : #'Wutan-Core'
}

{ #category : #accessing }
WuPage class >> pageName [
	^ self subclassResponsibility
]

{ #category : #accessing }
WuPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]
