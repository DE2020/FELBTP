using { FEL as my } from '../db/schema.cds';


@requires: 'authenticated-user'
service fELSrv @(path:'/service/fEL'){
    @readonly
    entity EDocStatus as projection on my.EDocStatus;
    entity EDocTypes as projection on my.EDocTypes;

}

@requires: 'authenticated-user'
service fELConfigSrv @(path:'/service/Admin') {

    entity EDocStatus as projection on my.EDocStatus;
    entity EDocTypes as projection on my.EDocTypes;

}