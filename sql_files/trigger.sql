--Trigger
CREATE FUNCTION public.package_insert()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
        UPDATE package_of_services set month_payment = 
        (SELECT sum(service.cost) from service_package_of_services
         join service on service.id=service_package_of_services.id_service 
         where service_package_of_services.id_pos=NEW."id_pos")
        where package_of_services.id=NEW."id_pos";
    return new;
    END;
$BODY$;

CREATE TRIGGER TRIGGER1
    AFTER INSERT 
    ON public.service_package_of_services
    FOR EACH ROW
    EXECUTE PROCEDURE public.package_insert();