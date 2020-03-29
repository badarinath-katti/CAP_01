using CatalogService from '../../srv/cat-service';

////////////////////////////////////////////////////////////////////////////
//
//	Books Lists
//
annotate CatalogService.Books with @(

	UI:{
		Identification: [{Value:title}],
		//SelectionFields: [ title, stock ],
		LineItem: [
			{Value: title, Label:'Title'},
			{Value: stock, Label: 'Stock' }
		]
	})

 {
	author @(
		// Common.Text: { $value:author.name, "@UI.TextArrangement": #TextOnly },
		ValueList.entity:'Authors',
		// Common.ValueList.Parameters:[
		// 	{ $Type:'Common.ValueListParameterInOut', LocalDataProperty:author_name, ValueListProperty:'name' },
		// ],
	);
};

////////////////////////////////////////////////////////////////////////////
//
//	Books Details
//
annotate CatalogService.Books with @(
	UI: {
  	HeaderInfo: {
  		TypeName: '{i18n>Book}',
  		TypeNamePlural: '{i18n>Books}',
  		Title: {Value: title},
  		Description: {Value: stock}
  	},
  	Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Random_ID}', Target: '@UI.FieldGroup#General'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Random_Title}', Target: '@UI.FieldGroup#Details'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Random_Stock}', Target: '@UI.FieldGroup#Admin'},
		],
		FieldGroup#General: {
			Data: [
				{Value: title},
				{Value: ID},
				{Value: author.name},
			]
		},
		FieldGroup#Details: {
			Data: [
				{Value: title},
				{Value: ID},
				{Value: stock},
			]
		},
		FieldGroup#Admin: {
			Data: [
				{Value: title},
				{Value: ID},
				{Value: stock},
			]
		}
	}
);

////////////////////////////////////////////////////////////////////////////
//
//	Books Elements
//
annotate CatalogService.Books with {
	ID @title:'ID' @UI.HiddenFilter;
	title @title:'Title';
	
	stock @title:'Stock';
	
}