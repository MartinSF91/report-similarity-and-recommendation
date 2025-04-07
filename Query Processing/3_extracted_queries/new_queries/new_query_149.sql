
SELECT DISTINCT "SQL1"."ARTKEY" AS "ARTKEY",
                "SQL1"."QTY" AS "QTY",
                "SQL1"."TOTALPALLETS" AS "TOTALPALLETS"
FROM
  (SELECT A1.Artkey,
          SUM(A1.AvailQty) Qty,
          ROUND(SUM(A1.Pallets), 2) TotalPallets
   FROM
     (SELECT AL1.BU_CODE_DT,
             AL1.BU_TYPE_DT,
             AL1.ASTRO_PART_NO,
             AL1.BU_CODE_SUP,
             AL1.BU_TYPE_SUP,
             AL1.ASTRO_PART_NO||'-'||TRIM(AL1.BU_CODE_DT) Artkey,
             AL1.PHYS_QTY_00,
             AL1.PHYS_QTY_BLOCKED,
             AL1.ITEM_QTY_PICK,
             AL2.ITEM_QTY_PALL,
             (AL1.PHYS_QTY_00-AL1.ITEM_QTY_PICK) AvailQty,
             (AL1.PHYS_QTY_00-AL1.ITEM_QTY_PICK)/AL2.ITEM_QTY_PALL Pallets
      FROM GEMINI.INVENTORY_FOR_ASTRO AL1,
           GEMINI.ITEM_SUP AL2
      WHERE AL1.ASTRO_PART_NO = AL2.ITEM_ID
        AND AL1.BU_CODE_SUP = AL2.BU_CODE_SUP
        AND (PHYS_QTY_00 + AL1.ITEM_QTY_PICK) > 0
        AND AL1.BU_TYPE_DT = 'DT') A1
   GROUP BY A1.Artkey) "SQL1"
SELECT DISTINCT "SQL12"."ARTKEY" AS "ARTKEY",
                "SQL12"."QTY" AS "QTY",
                "SQL12"."TOTALPALLETS" AS "TOTALPALLETS"
FROM
  (SELECT A1.Artkey,
          SUM(A1.AvailQty) Qty,
          ROUND(SUM(A1.Pallets), 2) TotalPallets
   FROM
     (SELECT AL1.BU_CODE_DT,
             AL1.BU_TYPE_DT,
             AL1.ASTRO_PART_NO,
             AL1.BU_CODE_SUP,
             AL1.BU_TYPE_SUP,
             AL1.ASTRO_PART_NO||'-'||TRIM(AL1.BU_CODE_DT) Artkey,
             AL1.PHYS_QTY_00,
             AL1.PHYS_QTY_BLOCKED,
             AL1.ITEM_QTY_PICK,
             AL2.ITEM_QTY_PALL,
             (AL1.PHYS_QTY_00-AL1.ITEM_QTY_PICK) AvailQty,
             (AL1.PHYS_QTY_00-AL1.ITEM_QTY_PICK)/AL2.ITEM_QTY_PALL Pallets
      FROM GEMINI.INVENTORY_FOR_ASTRO AL1,
           GEMINI.ITEM_SUP AL2
      WHERE AL1.ASTRO_PART_NO = AL2.ITEM_ID
        AND AL1.BU_CODE_SUP = AL2.BU_CODE_SUP
        AND (PHYS_QTY_00 + AL1.ITEM_QTY_PICK) > 0
        AND AL1.BU_TYPE_DT = 'DT') A1
   GROUP BY A1.Artkey) "SQL12"