SELECT ACCTG_REFERENCE_NO, ACCTG_APPROVAL, COUNT(ACCTG_REFERENCE_NO) as count
FROM APPS.Imp_bill_info_acc
WHERE ACCTG_REFERENCE_NO = 'YLP-06-23U5'
GROUP BY ACCTG_REFERENCE_NO, ACCTG_APPROVAL;