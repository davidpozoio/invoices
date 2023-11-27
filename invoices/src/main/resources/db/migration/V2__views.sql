CREATE VIEW  invoice_view as
    select i.*, c.full_name
    from invoice i
    join client c on c.id = i.client_id;