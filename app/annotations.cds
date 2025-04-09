using { fELSrv } from '../srv/service.cds';

annotate fELSrv.EDOCTypes with @UI.HeaderInfo: { TypeName: 'EDOC Type', TypeNamePlural: 'EDOC Types', Title: { Value: typeId } };
annotate fELSrv.EDOCTypes with {
  ID @UI.Hidden @Common.Text: { $value: typeId, ![@UI.TextArrangement]: #TextOnly }
};
annotate fELSrv.EDOCTypes with @UI.Identification: [{ Value: typeId }];
annotate fELSrv.EDOCTypes with {
  typeId @title: 'Type ID';
  description @title: 'Description';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate fELSrv.EDOCTypes with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: typeId },
 { $Type: 'UI.DataField', Value: description }
];

annotate fELSrv.EDOCTypes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: typeId },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate fELSrv.EDOCTypes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', Label: '{i18n>Translations}', Target: 'texts/@UI.LineItem' }
];

annotate fELSrv.EDOCTypes.texts @(UI: {
  Identification: [{ Value: 'description' }],
  SelectionFields: [locale, description],
  LineItem: [
    { Value: locale, Label: 'Locale' },
    { Value: description, Label: 'Description' }
  ]
});

annotate fELSrv.EDOCTypes with @UI.SelectionFields: [
  typeId
];

