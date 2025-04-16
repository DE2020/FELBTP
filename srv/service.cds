using { FEL as FE } from '../db/schema.cds';


service AdminService @(path: '/admin')
{
    annotate EDocStatus 
    {
        createdAt
            @Core.Immutable : null;
        createdBy
            @Core.Immutable : null;
    }

    entity EDocStatus as
        projection on FE.EDocStatus
        {
            *
        }
        excluding
        {
            eDocs
        };
}

annotate AdminService with @requires :
[
    'authenticated-user'
];
