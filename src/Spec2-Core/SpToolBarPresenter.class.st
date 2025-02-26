"
I'm a presenter to render a toolbar.
I can receive any kind of ToolBarItemPresenters, even if the most frequent one is ToolBarButton.

Toolbars can be displayed in diferent modes: 
- icons and labels (default)
- icons
- labels

And they can be placed at the left (default) or at the right. 
Not all platforms support left/right alignments for toolbars. In that case they will be presented as simple groups.
"
Class {
	#name : #SpToolBarPresenter,
	#superclass : #SpAbstractWidgetPresenter,
	#instVars : [
		'#displayMode => SpObservableSlot',
		'#leftItems => SpObservableSlot',
		'#rightItems => SpObservableSlot'
	],
	#category : #'Spec2-Core-Widgets-Toolbar'
}

{ #category : #specs }
SpToolBarPresenter class >> adapterName [

	^ #ToolBarAdapter
]

{ #category : #convenience }
SpToolBarPresenter >> addButtonLabel: aLabel iconNamed: anIconName help: aHelpString action: aBlock [

	self addItem: (SpToolBarButton new
		label: aLabel;
		icon: (self application iconNamed: anIconName);
		help: aHelpString;
		action: aBlock;
		yourself)
]

{ #category : #adding }
SpToolBarPresenter >> addItem: aToolbarItem [
	
	self addItem: aToolbarItem position: SpToolBarItemPosition left
]

{ #category : #adding }
SpToolBarPresenter >> addItem: aToolbarItem position: aPosition [
	
	aToolbarItem owner: self.
	aPosition addItem: aToolbarItem into: self
]

{ #category : #adding }
SpToolBarPresenter >> addItemLeft: aSpToolBarItem [ 
	
	leftItems add: aSpToolBarItem.
	self notifyPropertyChanged: #leftItems.
]

{ #category : #adding }
SpToolBarPresenter >> addItemRight: aSpToolBarItem [ 

	rightItems add: aSpToolBarItem.
	self notifyPropertyChanged: #rightItems.	
]

{ #category : #accessing }
SpToolBarPresenter >> beBoth [

	displayMode := SpToolBarDisplayMode modeIconAndLabel
]

{ #category : #accessing }
SpToolBarPresenter >> beIcons [

	displayMode := SpToolBarDisplayMode modeIcon
]

{ #category : #accessing }
SpToolBarPresenter >> beText [

	displayMode := SpToolBarDisplayMode modeLabel
]

{ #category : #accessing }
SpToolBarPresenter >> displayMode [

	^ displayMode
]

{ #category : #initialization }
SpToolBarPresenter >> initialize [

	super initialize.
	self beBoth.
	
	leftItems := OrderedCollection new.
	rightItems := OrderedCollection new.	
]

{ #category : #testing }
SpToolBarPresenter >> isDisplayModeBoth [

	^ self displayMode = SpToolBarDisplayMode modeIconAndLabel
]

{ #category : #testing }
SpToolBarPresenter >> isDisplayModeIcons [

	^ self displayMode = SpToolBarDisplayMode modeIcon
]

{ #category : #testing }
SpToolBarPresenter >> isDisplayModeText [

	^ self displayMode = SpToolBarDisplayMode modeLabel
]

{ #category : #testing }
SpToolBarPresenter >> isEmpty [
	
	^ self items isEmpty
]

{ #category : #accessing }
SpToolBarPresenter >> itemNamed: aString [ 
	
	^ self items detect: [ :e | e label = aString ]
]

{ #category : #api }
SpToolBarPresenter >> items [

	^ leftItems , rightItems
]

{ #category : #accessing }
SpToolBarPresenter >> leftItems [
	^ leftItems
]

{ #category : #testing }
SpToolBarPresenter >> notEmpty [

	^ self isEmpty not
]

{ #category : #removing }
SpToolBarPresenter >> removeAllItems [ 
	leftItems := OrderedCollection new.
	rightItems := OrderedCollection new.	
]

{ #category : #accessing }
SpToolBarPresenter >> rightItems [
	^ rightItems
]

{ #category : #events }
SpToolBarPresenter >> whenItemsChangeDo: aBlockClosure [ 
	
	self 
		property: #leftItems whenChangedDo: aBlockClosure;
		property: #rightItems whenChangedDo: aBlockClosure
]
