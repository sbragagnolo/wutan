Class {
	#name : #WuFooter,
	#superclass : #WuComponent,
	#category : #Wutan
}

{ #category : #accessing }
WuFooter >> links [
	^ OrderedDictionary
		with: 'Github' -> 'https://github.com/DuneSt/MaterialDesignLite'
		with: 'Pharo' -> 'http://pharo.org/'
		with: 'Seaside' -> 'https://github.com/SeasideSt/Seaside'
		with: 'Material Design' -> 'https://material.io/guidelines/'
		with: 'Material Design Lite' -> 'https://getmdl.io/'
]

{ #category : #accessing }
WuFooter >> renderContentOn: html [
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'Wutan'.
					html
						mdlMiniFooterLinkList: [ self links
								keysAndValuesDo: [ :label :url | 
									html
										listItem: [ html anchor
												url: url;
												target: '_blank';
												with: label ] ] ] ].
			html mdlMiniFooterRightSection: [ html mdlMiniFooterLinkList: [ html listItem: [ html text: 'Santiago Bragagnolo' ] ] ] ]
]
