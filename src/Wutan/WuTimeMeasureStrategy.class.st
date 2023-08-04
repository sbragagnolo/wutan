Class {
	#name : #WuTimeMeasureStrategy,
	#superclass : #WuMeasureStrategy,
	#category : #'Wutan-Model'
}

{ #category : #'as yet unclassified' }
WuTimeMeasureStrategy >> estimateDuration: anInteger [

	^ anInteger asSeconds
]
