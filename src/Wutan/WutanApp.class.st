Class {
	#name : #WutanApp,
	#superclass : #WuComponent,
	#instVars : [
		'header',
		'footer',
		'componentToDisplay',
		'componentInstances'
	],
	#category : #Wutan
}

{ #category : #initialization }
WutanApp class >> canBeRoot [
	^ true
]

{ #category : #initialization }
WutanApp class >> initialize [
	^ self initializeAs: 'Wutan'
]

{ #category : #initialization }
WutanApp class >> initializeAs: aString [
	| app |
	self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ].
	app := WAAdmin register: self asApplicationAt: aString.

	app configuration
		at: #maximumAbsoluteAge put: 0;
		at: #maximumRelativeAge put: 7 days asSeconds.

	app
		preferenceAt: #sessionClass put: WuSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: MDLDemoLibrary.
	^ app
]

{ #category : #initialization }
WutanApp class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Wutan')
		order: 2;
		iconName: #nautilus;
		parent: #Library;
		help: 'Open the demo in the default web browser';
		action: [ self open ].
]

{ #category : #initialization }
WutanApp class >> open [
	<script>
	| port url |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	url := 'http://localhost:' , port asString , '/Wutan'.
	self flag: #pharo6.
	SystemVersion current major < 7
		ifTrue: [ self class environment
				at: #OSProcess
				ifPresent: [ :class | class command: 'open ' , url ]
				ifAbsent: [ self inform: 'Open ' , url , ' or install OSProcess.' ] ]
		ifFalse: [ WebBrowser openOn: url ]
]

{ #category : #initialization }
WutanApp class >> version [
	^ 'v0.0.1'
]

{ #category : #rendering }
WutanApp >> componentInstances [
	^ componentInstances
]

{ #category : #accessing }
WutanApp >> componentToDisplay [
	^ componentToDisplay
]

{ #category : #rendering }
WutanApp >> componentToDisplay: anObject [
	componentToDisplay := anObject
]

{ #category : #rendering }
WutanApp >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #rendering }
WutanApp >> footer [
	^ footer ifNil: [ footer := WuFooter new  ]
]

{ #category : #rendering }
WutanApp >> header [
	^ header ifNil: [ header := WuHeader new  ]
]

{ #category : #rendering }
WutanApp >> initialize [

	super initialize.
	self session rootComponent: self.
	componentInstances := Dictionary new.
	self displayInstanceOf: MDLDemoPage pagesToDisplay first
]

{ #category : #rendering }
WutanApp >> renderContentOn: html [

	html mdlLayout: [
		html render: self header.
		html mdlLayoutContent
			class: 'mdl-color-text--grey-600';
			with: [
				html mdlGrid
					noSpacing;
					with: [
						html mdlCell
							class: 'mdl-components';
							size: 12;
							with: [ html render: componentToDisplay ] ].
				html render: self footer ].
		html mdlButton
			id: #scrollTop;
			fab;
			miniFab;
			colored;
			with: [ html mdlIcon: #arrow_upward ] ]
]

{ #category : #rendering }
WutanApp >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Demo - Material Design Lite for Seaside'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	self updateTabIconRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.indigo-teal.min.css').
	anHtmlRoot javascript add: 'hljs.initHighlightingOnLoad();'
]

{ #category : #rendering }
WutanApp >> updateTabIconRoot: anHtmlRoot [
	anHtmlRoot link
		relationship: 'apple-touch-icon';
		attributeAt: 'sizes' put: '120x120';
		url: (MDLDemoLibrary urlOf: 'appleicon120x120Png').
	#('32x32' '16x16')
		do: [ :size | 
			anHtmlRoot link
				relationship: 'icon';
				type: 'image/png';
				url: (MDLDemoLibrary urlOf: 'favicon' , size , 'Png');
				attributeAt: 'sizes' put: size ].
	anHtmlRoot link
		relationship: 'manifest';
		url: (MDLDemoLibrary urlOf: 'siteWebmanifest').
	anHtmlRoot meta
		name: 'msapplication-TileColor';
		content: '#da532c'.
	anHtmlRoot link
		relationship: 'mask-icon';
		attributeAt: 'color' put: '#5bbad5';
		url: (MDLDemoLibrary urlOf: 'safaripinnedtabSvg').
	anHtmlRoot meta
		name: 'theme-color';
		content: '#ffffff'
]

{ #category : #rendering }
WutanApp >> version [
	^ self class version
]
