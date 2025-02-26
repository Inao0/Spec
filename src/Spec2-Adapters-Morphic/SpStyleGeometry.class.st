Class {
	#name : #SpStyleGeometry,
	#superclass : #SpStyleProperty,
	#instVars : [
		'extent',
		'minExtent',
		'maxExtent',
		'hResizing',
		'vResizing'
	],
	#category : #'Spec2-Adapters-Morphic-StyleSheet'
}

{ #category : #'ston-core' }
SpStyleGeometry class >> stonName [
	
	^ 'Geometry'
]

{ #category : #operations }
SpStyleGeometry >> applyTo: aMorph [

	aMorph
		width: (self geometryValueBetween: self extentOrDefault x and: aMorph width);		
		height: (self geometryValueBetween: self extentOrDefault y and: aMorph height);
		hResizing: (self resizingStringFor: self hResizing);
		vResizing: (self resizingStringFor: self vResizing)
]

{ #category : #private }
SpStyleGeometry >> calculatedExtent [

	self extent ifNotNil: [ :aPoint | ^ aPoint ].
	self minExtent ifNotNil: [ :aPoint | aPoint ].
	
	^ 10@10
]

{ #category : #accessing }
SpStyleGeometry >> extent [

	^ extent
]

{ #category : #accessing }
SpStyleGeometry >> extent: aPoint [ 

	extent := aPoint
]

{ #category : #private }
SpStyleGeometry >> extentOrDefault [

	^ extent ifNil: [ 0@0 ]
]

{ #category : #private }
SpStyleGeometry >> geometryValueBetween: baseNumber and: otherNumber [

	^ baseNumber = 0 
		ifTrue: [ otherNumber ]
		ifFalse: [ baseNumber ]
]

{ #category : #accessing }
SpStyleGeometry >> hResizing [

	^ hResizing
]

{ #category : #accessing }
SpStyleGeometry >> hResizing: aBoolean [

	hResizing := aBoolean
]

{ #category : #accessing }
SpStyleGeometry >> height [

	^ self extent ifNotNil: [ :aPoint | aPoint y ]
]

{ #category : #accessing }
SpStyleGeometry >> height: aNumber [
	
	self extent: (self extentOrDefault x@aNumber)
]

{ #category : #initialization }
SpStyleGeometry >> initialize [

	super initialize.
	self hResizing: false.
	self vResizing: false
]

{ #category : #accessing }
SpStyleGeometry >> maxExtent [
	^ maxExtent
]

{ #category : #accessing }
SpStyleGeometry >> maxExtent: anObject [
	maxExtent := anObject
]

{ #category : #accessing }
SpStyleGeometry >> minExtent [
	^ minExtent
]

{ #category : #accessing }
SpStyleGeometry >> minExtent: anObject [
	minExtent := anObject
]

{ #category : #private }
SpStyleGeometry >> resizingStringFor: expand [

	^ expand
		ifTrue: [ #spaceFill ]
		ifFalse: [ #rigid ]
]

{ #category : #accessing }
SpStyleGeometry >> vResizing [

	^ vResizing
]

{ #category : #accessing }
SpStyleGeometry >> vResizing: aBoolean [

	vResizing := aBoolean
]

{ #category : #accessing }
SpStyleGeometry >> width [

	^ self extent ifNotNil: [ :aPoint | aPoint x ]
]

{ #category : #accessing }
SpStyleGeometry >> width: aNumber [

	self extent: (aNumber @ self extentOrDefault y)
]
