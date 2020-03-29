using CatalogService from '../../srv/cat-service';

////////////////////////////////////////////////////////////////////////////
//
//	Books Lists
//
annotate CatalogService.Authors with @(

	UI:{
		Identification: [{Value:title}],
		//SelectionFields: [ title, stock ],
		LineItem: [
			{Value: name, Label:'Name of the Author'},
			{Value: placeOfBirth, Label: 'placeOfBirth' }
		]
	})

 {
};

////////////////////////////////////////////////////////////////////////////
//
//	Books Details
//
annotate CatalogService.Authors with @(
	UI: {
  	HeaderInfo: {
  		TypeName: '{i18n>Book}',
  		TypeNamePlural: '{i18n>Books}',
  		Title: {Value: name},
  		Description: {Value: placeOfBirth}
  	},
  	Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Name}', Target: '@UI.FieldGroup#General'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Random_Title}', Target: '@UI.FieldGroup#Details'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Random_Stock}', Target: '@UI.FieldGroup#Admin'},
		],
		FieldGroup#General: {
			Data: [
				{Value: name},
				{Value: ID},
				{Value: placeOfBirth},
			]
		},
		FieldGroup#Details: {
			Data: [
				{Value: name},
				{Value: ID},
				{Value: placeOfBirth},
			]
		},
		FieldGroup#Admin: {
			Data: [
				{Value: name},
				{Value: ID},
				{Value: placeOfBirth},
			]
		}
	}
);

////////////////////////////////////////////////////////////////////////////
//
//	Books Elements
//
annotate CatalogService.Authors with {
	ID @title:'ID' @UI.HiddenFilter;
	name @title:'Name of the Author';
	
	placeOfBirth @title:'Place of Birth';
	
}