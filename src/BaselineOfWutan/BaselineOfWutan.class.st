Class {
	#name : #BaselineOfWutan,
	#superclass : #BaselineOf,
	#category : #BaselineOfWutan
}

{ #category : #baselines }
BaselineOfWutan >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self
			seaside3: spec;
			materialDesign: spec;
			voyageMongo: spec.
		"Packages"
		spec
			package: 'Wutan'
			with: [
			spec requires: #( 'MaterialDesignLite' 'Seaside3' 'Voyage' ) ] ]
]

{ #category : #baselines }
BaselineOfWutan >> materialDesign: spec [
	spec
		baseline: 'MaterialDesignLite'
    	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #baselines }
BaselineOfWutan >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
"				loads: #('Core' 'JQuery' 'Zinc');"
				repository: 'github://SeasideSt/Seaside:v3.4.x/repository' ]
]

{ #category : #baselines }
BaselineOfWutan >> voyageMongo: spec [
	spec
		baseline: 'Voyage'
		with: [ spec
				loads: #('mongo' 'tests');
				repository: 'github://pharo-nosql/voyage:v1.8.x/mc' ]
			
]
