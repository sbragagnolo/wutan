Class {
	#name : #TestTimeStrategy,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'strategy',
		'expectedDuration',
		'amount'
	],
	#category : #'Wutan-Tests'
}

{ #category : #'building suites' }
TestTimeStrategy class >> addTimeMeasureCases: params [

	params
		addCase: {
				(#strategy -> WuTimeMeasureStrategy new).
				(#amount -> 1).
				(#expectedDuration -> 1 second) };
		yourself
]

{ #category : #'building suites' }
TestTimeStrategy class >> testParameters [
	| params | 
	params :=  ParametrizedTestMatrix new.
	self addTimeMeasureCases: params.
	^ params.
	
]

{ #category : #running }
TestTimeStrategy >> amount [

	^ amount
]

{ #category : #accessing }
TestTimeStrategy >> amount: anInteger [ 
	amount := anInteger
]

{ #category : #running }
TestTimeStrategy >> expectedDuration [
	 ^ expectedDuration
]

{ #category : #accessing }
TestTimeStrategy >> expectedDuration: aDuration [ 
	expectedDuration := aDuration
]

{ #category : #running }
TestTimeStrategy >> setUp [

	super setUp.
	strategy := WuTimeMeasureStrategy new.
]

{ #category : #running }
TestTimeStrategy >> setUpOneOne [

	self
		assert: (self testedStrategy estimateDuration: self amount)
		equals: self expectedDuration
]

{ #category : #accessing }
TestTimeStrategy >> strategy [
	^ strategy
]

{ #category : #accessing }
TestTimeStrategy >> strategy: aWuTimeMeasureStrategy [ 
	strategy := aWuTimeMeasureStrategy
]

{ #category : #running }
TestTimeStrategy >> testOneOne [

	self
		assert: (self strategy estimateDuration: self amount)
		equals: self expectedDuration
]
