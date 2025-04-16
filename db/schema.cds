namespace FEL;

using
{
    cuid,
    managed
}
from '@sap/cds/common';

entity EDocStatus : managed
{
    key statusID : String(2);
    description : String(40) not null;
    statusBase : enumEDOCStatusBase;
    eDocs : Association to many EDoc on eDocs.status = $self;
}

annotate EDocStatus with @assert.unique :
{
    statusID : [ statusID ],
};

entity EDocTypes : managed
{
    key typeId : String(3)
        @mandatory
        @Core.Description : 'Description';
    description : localized String(60);
    typeERP : enumEDOCTypeERP;
    eDocs : Composition of many EDoc on eDocs.type = $self;
}

annotate EDocTypes with @assert.unique :
{
    typeId : [ typeId ],
};

entity EDoc : cuid, managed
{
    type : Association to EDocTypes;
    status : Association to EDocStatus;
}

type enumEDOCStatusBase : String enum
{
    New = 'N';
    Parcial = 'P';
    Finish = 'F';
    Error = 'E';
}

type enumEDOCTypeERP : String enum
{
    invoiceSD = 'V1';
    DocFI = 'F1';
}
