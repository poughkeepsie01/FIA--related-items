select *
from XX00IFGL_JOURNAL_IF_ALL
where 1=1
and ftp_file_name = 'GLCMNEBS_20191003_001_L.dat'
and process_status <> 'TRANSFERRED';

select *
from XX00IFGL_JOURNAL_STG_ALL
WHERE 1=1
and process_status <> 'INTERFACED';
--2801396

select *
from rcv_receiving_sub_ledger
where 2=2
and rcv_transaction_id = '10569002'


select *
from po_headers_all
where 1=1
and segment1 = '6551183'


select *
from po_lines_all
where 1=1
and po_header_id = '7832333'

select *
from mtl_parameters
where 1=1
and organization_id = '101'