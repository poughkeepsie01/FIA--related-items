select ib.PERIOD_NAME "Period Name"
,      ib.ORGANIZATION_CODE "Org Code"
,      ib.COST_CENTER "Center"
,      ib.MAIN_ACC_CODE "Natural Account"
,      ib.SUBINVENTORY_CODE "Location"
,      ib.ITEM_CODE "Item Code"
,      ib.DESCRIPTION "Item Description"
,      ib.ITEM_TYPE "Item Type"
,      ib.UOM "UOM"
,      nvl(ib.PREVIOUS_MOV_AVE_COST, 0) "Prev Unit Cost"
,      nvl(ib.PREVIOUS_QTY, 0) "Prev Qty"
,      nvl(ib.PREVIOUS_AMOUNT, 0) "Prev Amt"
,      mv.RECIEPT_QTY "Receipt Qty"
,      mv.RECIEPT_AMOUNT "Receipt Amt"
,      mv.RETURN_QTY "Retern Qty"
,      mv.RETURN_AMOUNT "Return Amt"
,      mv.BALANCE_QTY "Balance Qty"
,      mv.BALANCE_AMOUNT "Balance Amt"
,      ib.CURRENT_MOV_AVE_COST "Current Unit Cost"
from   xxia.IAS_BALANCE ib
,      xxia.IAS_BALANCE_MV mv
where  ib.ORGANIZATION_CODE = mv.ORGANIZATION_CODE
and    ib.ITEM_CODE = mv.ITEM_CODE
and    ib.PERIOD_NAME = mv.PERIOD_NAME
and    ib.SUBINVENTORY_CODE = :"*Organization Code" ||'MAT'
and    ib.ORGANIZATION_CODE = :"*Organization Code"
and    ib.PERIOD_NAME       = :"*Period Name (MON-YYYY)"
and    ib.ITEM_CODE      like :"Item Code" ||'%'
union
select ib.PERIOD_NAME "Period Name"
,      ib.ORGANIZATION_CODE "Org Code"
,      ib.COST_CENTER "Center"
,      ib.MAIN_ACC_CODE "Natural Account"
,      ib.SUBINVENTORY_CODE "Location"
,      ib.ITEM_CODE "Item Code"
,      ib.DESCRIPTION "Item Description"
,      ib.ITEM_TYPE "Item Type"
,      ib.UOM "UOM"
,      nvl(ib.PREVIOUS_MOV_AVE_COST, 0) "Prev Unit Cost"
,      nvl(ib.PREVIOUS_QTY, 0) "Prev Qty"
,      nvl(ib.PREVIOUS_AMOUNT, 0) "Prev Amt"
,      mv.RECIEPT_QTY "Receipt Qty"
,      mv.RECIEPT_AMOUNT "Receipt Amt"
,      mv.RETURN_QTY "Retern Qty"
,      mv.RETURN_AMOUNT "Return Amt"
,      mv.BALANCE_QTY "Balance Qty"
,      mv.BALANCE_AMOUNT "Balance Amt"
,      ib.CURRENT_MOV_AVE_COST "Current Unit Cost"
from   xxia.IAS_BALANCE_HST ib
,      xxia.IAS_BALANCE_MV_HST mv
where  ib.ORGANIZATION_CODE = mv.ORGANIZATION_CODE
and    ib.ITEM_CODE = mv.ITEM_CODE
and    ib.PERIOD_NAME = mv.PERIOD_NAME
and    ib.SUBINVENTORY_CODE = :"*Organization Code" ||'MAT'
and    ib.ORGANIZATION_CODE = :"*Organization Code"
and    ib.PERIOD_NAME       = :"*Period Name (MON-YYYY)"
and    ib.ITEM_CODE      like :"Item Code" ||'%'
