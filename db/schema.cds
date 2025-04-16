namespace FEL;

using
{
    cuid,
    managed
}
from '@sap/cds/common';

type enumEDOCStatusBase : String enum
{
    New = 'N';
    Parcial = 'P';
    Finish = 'F';
    Error = 'E';
}


entity EDocTypes : managed
{
    key typeId : String(3)
        @mandatory
        @Core.Description : 'Description';
    description : localized String(60);
}

annotate EDocTypes with @assert.unique :
{
    typeId : [ typeId ],
};

entity EDocStatus : managed
{
    key statusID : String(2);
    description : String(40) not null;
    statusBase: enumEDOCStatusBase;

}

annotate EDocStatus with @assert.unique :
{
    statusID : [ statusID ],
};

entity EDoc : cuid, managed
{
    type : Association to one EDocTypes;
    status : Association to one EDocStatus;
}

