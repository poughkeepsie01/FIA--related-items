


select  * from APPS.TIP_LASTPAY_LINES_INTERFACE
where document_num = 'PRF51276'

minus

select employee_num  from APPS.TIP_LASTPAY_HEADERS_INTERFACE
where document_num = 'PRF51276'


select distinct employee_num from APPS.TIP_LASTPAY_LINES_INTERFACE
where document_num = 'PRF51276'

T090593417C0100
select * from GL.GL_INTERFACE
where 