Class {
	#name : #WuHeader,
	#superclass : #WuComponent,
	#category : #'Wutan-Core'
}

{ #category : #rendering }
WuHeader >> possiblePages [

	^ {
		  WuTrainingSessionPage.
		  WuExercisePage.
		  WuTrainingStatisticsPage.
		  WuConfigurationPage.
		  WuContactPage }
]

{ #category : #rendering }
WuHeader >> renderContentOn: html [

	html mdlLayoutHeader
		waterfall;
		with: [
			html mdlLayoutHeaderRow: [
					html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [
							html mdlLayoutTitle: [
									html image
										style: 'width: 40px; height: 40px;';
										url: (MDLDemoLibrary urlOf: 'logoSvg').
									html text: ' Wutan training facility ' ] ].
					html mdlLayoutSpacer.
					html text: '	Version ' , self version ].
			html mdlLayoutTabBar: [
				self possiblePages do: [ :aClass |
					html mdlLayoutTab
						callback: [ self displayInstanceOf: aClass ];
						isActiveIf: aClass = self rootComponent componentToDisplay class;
						with: aClass pageName ] ] ]
]
