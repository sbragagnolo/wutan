Class {
	#name : #WuMenuNavigatablePage,
	#superclass : #WuPage,
	#instVars : [
		'componentToDisplay',
		'componentInstances'
	],
	#category : #Wutan
}

{ #category : #rendering }
WuMenuNavigatablePage >> componentInstances [
	^ componentInstances ifNil: [ componentInstances := Dictionary new ]
]

{ #category : #rendering }
WuMenuNavigatablePage >> componentToDisplay [
	^ componentToDisplay
]

{ #category : #rendering }
WuMenuNavigatablePage >> componentToDisplay: anObject [
	componentToDisplay := anObject
]

{ #category : #rendering }
WuMenuNavigatablePage >> defaultPage [
	self subclassResponsibility 
]

{ #category : #rendering }
WuMenuNavigatablePage >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #rendering }
WuMenuNavigatablePage >> initialize [

	super initialize.
	self displayInstanceOf: self defaultPage.
]

{ #category : #rendering }
WuMenuNavigatablePage >> menuComponents [
	 self subclassResponsibility 
]

{ #category : #rendering }
WuMenuNavigatablePage >> renderContentOn: html [

	html div
		class: 'container';
		shadow: 2;
		with: [
			html div
				class: 'bar';
				with: [
					html mdlButton icon
						id: #bottomLeftButton;
						with: [ html mdlIcon: #more_vert ].
					html mdlMenu
						bottomLeft;
						for: #bottomLeftButton;
						with: [
							self menuComponents keysAndValuesDo: [ :entryName :class |
									html mdlMenuItem: [
											html anchor
												callback: [ self displayInstanceOf: class ];
												with: entryName ] ] ].
					html mdlGrid
						noSpacing;
						with: [
							html mdlCell
								class: 'mdl-components';
								size: 12;
								with: [ html render: componentToDisplay ] ] ].
			html div class: 'background' ]
]
