Class {
	#name : #WuPage,
	#superclass : #WuComponent,
	#category : #Wutan
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
