using ProjectService as service from '../../srv/project-service';
using from './value-helps';
using from './labels';
using from '../../db/schema';

annotate service.Project with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ProjectID,
            Label : '{i18n>Projectid}',
        },
        {
            $Type : 'UI.DataField',
            Value : BeginDate,
            Label : 'BeginDate',
        },
        {
            $Type : 'UI.DataField',
            Value : EndDate,
            Label : 'EndDate',
        },
        {
            $Type : 'UI.DataField',
            Value : ManagerFullName,
            Label : '{i18n>Manager}',
        },
        {
            $Type : 'UI.DataField',
            Value : InstutationName,
            Label : 'InstutationName',
        },
        {
            $Type : 'UI.DataField',
            Value : ProjectStatus_code,
            Criticality : ProjectStatus.criticality,
        },
    ]
);

annotate service.Project with @(
    UI.SelectionFields : [
        BeginDate,
        EndDate,
        to_Manager_PersonID,
        to_Company_CompanyID,
        ProjectStatus_code,
    ]
);

annotate service.Project with @(
    Analytics.AggregatedProperty #ProjectID_countdistinct : {
        $Type : 'Analytics.AggregatedPropertyType',
        Name : 'ProjectD_countdistinct',
        AggregatableProperty : ProjectID,
        AggregationMethod : 'countdistinct',
        ![@Common.Label] : 'ProjectID (Count Distinct Values)',
    },
    UI.Chart #alpChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Dimensions : [
            to_Company_CompanyID,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ProjectID_countdistinct',
        ],
    }
);
annotate service.Project with @(
    UI.Chart #visualFilter : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            to_Company_CompanyID,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ProjectID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter',
        ],
    }
);
annotate service.Project with {
    to_Company @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Project',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : to_Company_CompanyID,
                ValueListProperty : 'to_Company_CompanyID',
            },
        ],
        PresentationVariantQualifier : 'visualFilter',
    }
};
annotate service.Project with @(
    UI.Chart #visualFilter1 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            ProjectStatus_code,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ProjectID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter1 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter1',
        ],
    }
);
// annotate service.Project with @(
//     UI.Chart #visualFilter2 : {
//         $Type : 'UI.ChartDefinitionType',
//         ChartType : #Bar,
//         Dimensions : [
//             to_Company_CompanyID,
//         ],
//         DynamicMeasures : [
//             '@Analytics.AggregatedProperty#ProjectID_countdistinct',
//         ],
//     },
//     UI.PresentationVariant #visualFilter2 : {
//         $Type : 'UI.PresentationVariantType',
//         Visualizations : [
//             '@UI.Chart#visualFilter2',
//         ],
//     }
// );


annotate service.Project with {
    InstutationName @(Common.Label : 'InstutationName'
)};
annotate service.Project with @(
    UI.Chart #visualFilter3 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            to_Manager_PersonID,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ProjectID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter3 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter3',
        ],
    }
);
annotate service.Project with {
    to_Manager @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Project',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : to_Manager_PersonID,
                ValueListProperty : 'to_Manager_PersonID',
            },
        ],
        PresentationVariantQualifier : 'visualFilter3',
    }
};
annotate service.Project with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>ProjectDetail}',
            ID : 'i18nProjectDetail',
            Target : '@UI.FieldGroup#i18nProjectDetail',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>ProjectsTickets}',
            ID : 'i18nProjectsTickets',
            Target : 'to_Ticket/@UI.LineItem#i18nProjectsTickets',
        },
    ],
    UI.FieldGroup #i18nProjectDetail : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BeginDate,
                Label : 'BeginDate',
            },{
                $Type : 'UI.DataField',
                Value : EndDate,
                Label : 'EndDate',
            },
            {
                $Type : 'UI.DataField',
                Value : ProjectName,
                Label : 'ProjectName',
            },{
                $Type : 'UI.DataField',
                Value : Description,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : to_Manager_PersonID,
                Label : '{i18n>Manager}',
            },
            {
                $Type : 'UI.DataField',
                Value : to_Company_CompanyID,
            },],
    }
);
annotate service.Project with @(
    UI.DataPoint #ProjectStatus_code : {
        $Type : 'UI.DataPointType',
        Value : ProjectStatus_code,
        Title : '{i18n>ProjectStatus}',
        Criticality : ProjectStatus.criticality,
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProjectStatus_code',
            Target : '@UI.DataPoint#ProjectStatus_code',
        },
    ]
);
annotate service.Project with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>ProjectID}',
        TypeNamePlural : '{i18n>Projects}',
        Title : {
            $Type : 'UI.DataField',
            Value : ProjectName,
        },
    }
);
annotate service.Ticket with @(
    UI.Identification                : [{Value: TicketID}, ],
    UI.LineItem #i18nProjectsTickets : [
        {
            $Type : 'UI.DataField',
            Value : TicketSubject,
            Label : '{i18n>TicketSubject}',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketOwner_PersonID,
            Label : '{i18n>TicketOwner}',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketForWho_PersonID,
            Label : '{i18n>TcketForWho}',
        },{
            $Type : 'UI.DataField',
            Value : TicketPriority_code,
            Label : 'TicketPriority_code',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketStatus_code,
            Criticality : TicketStatus.criticality,
        },]
);
annotate service.Project with {
    to_Company @Common.Label : '{i18n>CompanyID}'
};
annotate service.Ticket with @(
    UI.DataPoint #TicketID : {
        Value : TicketID,
    },
    UI.Chart #TicketID : {
        ChartType : #Area,
        Title : 'TicketID',
        Measures : [
            TicketID,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#TicketID',
                Role : #Axis1,
                Measure : TicketID,
            },
        ],
        Dimensions : [
            TicketID,
        ],
    }
);
annotate service.ProjectStatus with @(
    UI.DataPoint #criticality : {
        Value : criticality,
        TargetValue : criticality,
    },
    UI.Chart #criticality : {
        ChartType : #Donut,
        Title : 'criticality',
        Measures : [
            criticality,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#criticality',
                Role : #Axis1,
                Measure : criticality,
            },
        ],
    }
);
