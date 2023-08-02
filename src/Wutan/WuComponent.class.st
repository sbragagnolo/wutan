Class {
	#name : #WuComponent,
	#superclass : #WAComponent,
	#category : #Wutan
}

{ #category : #accessing }
WuComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #accessing }
WuComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
WuComponent >> rootComponent [
	^ self session rootComponent
]

{ #category : #accessing }
WuComponent >> version [
	^ self rootComponent version
]
