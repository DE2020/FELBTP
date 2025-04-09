using { FEL as my } from '../db/schema.cds';

@path: '/service/fEL'
@requires: 'authenticated-user'
service fELSrv {
    entity EDOC as projection on my.EDOC;
}