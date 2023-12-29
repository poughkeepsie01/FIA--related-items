select *
from imp_bill_info
where 1=1
and invoice_no ='FDX-06-19P4'



select *
from imp_bill_info_acc
where 1=1
and ACCTG_REFERENCE_NO ='FDX-06-19P4'


select *
from ap_batches_all
where 300=300
and batch_name = 'AS190627_FREIGHT_PHP'


select *
from ap_invoices_all
where 1=1
and batch_id = '2788517'



select *
from tipcbs_default_values;