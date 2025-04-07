SELECT DISTINCT *
FROM
  (SELECT r08t1.oppdate "_Plan Date",
          trim(r08t1.routeno)||'-'||r08t1.tripno "_Route",
          r08t1.etripid,
          o04t1.deladr "_Consignee",
          '000000' || r08t1.shortr08 || ' or ' || r23t1.r23extid "_Route ID",
          o04t1.regdate "_Order Date", --o04t1.deldate "_Delivery Date",
 --o04t1.ordno "_Astro Order ID",
 --o04t1.eorderid "_Booking No",
 --o08t1.wordref "_WordRef",
  -- Customer Billing Address
 --case
 --when adrBill.d10name1 is null and adrBill.d50adrs1 is null then adrBill.d10name1 || 'Not Provided'
 --when adrBill.d10name2 is null and adrBill.d50adrs2 is null then adrBill.d10name1 || chr(10) || adrBill.d50adrs1 || chr(10) || adrBill.d50city || ', ' || adrBill.d50state || ' ' || adrBill.d50zipc || chr(10) || adrBill.d50cntry
 --when adrBill.d10name2 is null then adrBill.d10name1 || chr(10) || adrBill.d50adrs1 || chr(10) || adrBill.d50adrs2 || chr(10) || adrBill.d50city || ', ' || adrBill.d50state || ' ' || adrBill.d50zipc || chr(10) || adrBill.d50cntry
 --when adrBill.d50adrs2 is null then adrBill.d10name1 || chr(10) || adrBill.d10name2 || chr(10) || adrBill.d50adrs1 || chr(10) || adrBill.d50city || ', ' || adrBill.d50state || ' ' || adrBill.d50zipc || chr(10) || adrBill.d50cntry
 --else adrBill.d10name1 || chr(10) || adrBill.d10name2 || chr(10) || adrBill.d50adrs1 || chr(10) || adrBill.d50adrs2 || chr(10) || adrBill.d50city || ', ' || adrBill.d50state || ' ' || adrBill.d50zipc || chr(10) || adrBill.d50cntry
 --end "_Billing Address",
 -- Delivery Address
 --case
 --when adrDel.d10name1 is null and adrDel.d50adrs1 is null then adrDel.d10name1 || 'Not Provided'
 --when adrDel.d10name2 is null and adrDel.d50adrs2 is null then adrDel.d10name1 || chr(10) || adrDel.d50adrs1 || chr(10) || adrDel.d50city || ', ' || adrDel.d50state || ' ' || adrDel.d50zipc || chr(10) || adrDel.d50cntry
 --when adrDel.d10name2 is null then adrDel.d10name1 || chr(10) || adrDel.d50adrs1 || chr(10) || adrDel.d50adrs2 || chr(10) || adrDel.d50city || ', ' || adrDel.d50state || ' ' || adrDel.d50zipc || chr(10) || adrDel.d50cntry
 --when adrDel.d50adrs2 is null then adrDel.d10name1 || chr(10) || adrDel.d10name2 || chr(10) || adrDel.d50adrs1 || chr(10) || adrDel.d50city || ', ' || adrDel.d50state || ' ' || adrDel.d50zipc || chr(10) || adrDel.d50cntry
 --else adrDel.d10name1 || chr(10) || adrDel.d10name2 || chr(10) || adrDel.d50adrs1 || chr(10) || adrDel.d50adrs2 || chr(10) || adrDel.d50city || ', ' || adrDel.d50state || ' ' || adrDel.d50zipc || chr(10) || adrDel.d50cntry
 --end "_Delivery Address",
  o40t2.ecarrno "_CPU ID",
  CASE
      WHEN o40t2.stato40 = '70' THEN 'Packed'
      WHEN o40t2.stato40 = '65' THEN 'Picked'
      WHEN o40t2.stato40 = '60' THEN 'Picking in process'
      WHEN o40t2.stato40 = '50' THEN 'Registered'
  END AS "_Status",
  cpuw.weight "_CPU Weight", --tu.dp "_TU ID",
 --tu.weight "_TU Weight",
  -- Article Information
 o08t1.PARTNO "_Article No",
 o08t1.PARTREV "_Supplier No", --case when o08t1.mha IN ( '11P2','11P6','11P7') then 'Box'
 -- else 'Pallet' end "_Article Type",
 SUBSTR(l62t1.PARTDSC1, 1, 25) "_Article Description", --case when dwp.numcp >1 then 'Multi-Box Item - ' || dwp.numcp || ' boxes'
 --when o08t1.mha IN ('11P2','11P6', '11P7') then 'Packed in Box' else ' ' end "_Custom Message",
 --o04t90.TRSPMSG||o04t90.TRSPMSG2 "_Transport Message",
 --dwp.numcp"_TrPac Qty",
  -- Combine Qty Shipped
 sum(sum(o42t2.OCQUANT)) OVER (PARTITION BY o04t1.ordno, o08t1.wordref, o40t2.ecarrno, o08t1.partno, o08t1.partrev) "_Shipped Qty" -- Combine Piece Qty Shipped
 --sum(sum(o42t2.OCQUANT*dwp.numcp)) over (partition by o04t1.ordno, o08t1.wordref, o40t2.ecarrno, o08t1.partno, o08t1.partrev) "_Shipped Piece Qty"

   FROM
     (SELECT o40.ecarrno DP,
             A1.CPU cpu,
             A1.weight,
             o04.ordno,
             o04.eorderid,
             o04t9.simdname
      FROM ASTRO.o42T2 o42,
           ASTRO.o06t1 o06,
           ASTRO.o04t1 o04,
           ASTRO.o04t90 o04t9,
           ASTRO.o40t2 o40,

        (SELECT o42.ocarrno DPID,
                o42.refo40 CPUID,
                o40.ecarrno CPU,
                cpuw.weight
         FROM ASTRO.o42t2 o42,
              ASTRO.o40t2 o40,

           (SELECT o40t2.ocarrno,
                   o40t2.weight
            FROM ASTRO.o40t2) cpuw
         WHERE o42type = 1
           AND o42.refo40 = o40.ocarrno
           AND cpuw.ocarrno = o40.ocarrno
         GROUP BY o42.ocarrno,
                  o42.refo40,
                  o40.ecarrno,
                  cpuw.weight
         ORDER BY o42.ocarrno,
                  o42.refo40,
                  o40.ecarrno) A1
      WHERE o42.ocarrno = A1.CPUID
        AND o42.shorto06 = o06.shorto06
        AND o06.shorto04 = o04.shorto04
        AND o04.shorto04 = o04t9.shorto04
        AND o40.ocarrno = A1.DPID
        AND o40.stato40 != '85'
      GROUP BY A1.DPID,
               o40.ecarrno,
               A1.CPUID,
               A1.CPU,
               A1.weight,
               o42.shorto06,
               o42.ocarrno,
               o04.ordno,
               o04.eorderid,
               o04t9.simdname) tu,

     (SELECT DISTINCT shortr08,
                      r23extid,
                      deladr,
                      shortr23
      FROM ASTRO.r23t1) r23t1,
        ASTRO.o04t1,
        ASTRO.o04t2,
        ASTRO.o04t90,
        ASTRO.ASTRO_VIEW_CNT_O08T1 o08t1,
        ASTRO.o42t2,
        ASTRO.o40t2,
        ASTRO.r08t1,
        ASTRO.l62t1,
        ASTRO.o06t1, -- DWP Consolidation

     (SELECT DISTINCT itemno,
                      bucodsup,
                      numcp,
                      lastupdate
      FROM
        (SELECT itemno,
                bucodsup,
                numcp,
                insdtime,
                upddtime,
                iipupdat,
                max(iipupdat) OVER (PARTITION BY itemno, bucodsup) AS lastupdate
         FROM dwpactcp
         ORDER BY iipupdat DESC)
      WHERE iipupdat = lastupdate
      ORDER BY itemno ASC,
               bucodsup ASC) dwp, -- FreeText Messages

     (SELECT sysshort,
             freecode,
             freetext
      FROM ASTRO.s80t1
      WHERE sysfromt = 'L62T1'
        AND freerow = 1
        AND freecode = '3') tbl2, -- CPU Weight

     (SELECT o40t2.ocarrno,
             o40t2.weight
      FROM ASTRO.o40t2) cpuw, -- Biling Address

     (SELECT a.sysshort,
             a.roletype,
             b.d10name1,
             b.d10name2,
             c.d50adrs1,
             c.d50adrs2,
             c.d50adrs3,
             c.d50adrs4,
             c.d50zipc,
             c.d50city,
             CASE
                 WHEN c.d50cntry = 'CA' THEN 'Canada'
                 WHEN c.d50state = 'US' THEN 'United States of America'
                 ELSE ''
             END AS d50cntry,
             substr(c.d50state, -2, 2) AS d50state,
             c.d50phone
      FROM ASTRO.d13t1 a,
           ASTRO.d10t1 b,
           ASTRO.d50t1 c
      WHERE roletype = 10
        AND a.shortd10 = b.shortd10
        AND b.adrid = c.adrid) adrBill, -- Delivery Address

     (SELECT a.sysshort,
             a.roletype,
             b.d10name1,
             b.d10name2,
             c.d50adrs1,
             c.d50adrs2,
             c.d50adrs3,
             c.d50adrs4,
             c.d50zipc,
             c.d50city,
             CASE
                 WHEN c.d50cntry = 'CA' THEN 'Canada'
                 WHEN c.d50state = 'US' THEN 'United States of America'
                 ELSE ''
             END AS d50cntry,
             substr(c.d50state, -2, 2) AS d50state,
             c.d50phone
      FROM ASTRO.d13t1 a,
           ASTRO.d10t1 b,
           ASTRO.d50t1 c
      WHERE roletype = 4
        AND a.shortd10 = b.shortd10
        AND b.adrid = c.adrid) adrDel
   WHERE -- Please update the division code below according to your site!
 o04t1.divcode = 013
     AND o04t1.shorto04 = adrBill.sysshort
     AND o04t1.shorto04 = adrDel.sysshort(+)
     AND o04t1.shortO04 = o04t2.shortO04
     AND o04t1.shortO04 = o04t90.shortO04
     AND o04t1.shortO04 = o08t1.shortO04
     AND o04t1.ordstat != '0'
     AND o04t1.deladr = r23t1.deladr
     AND o04t1.eorderid = o08t1.eorderid
     AND o04t1.CUSTNAM1 IS NOT NULL
     AND o08t1.shorto08 = o42t2.shorto08
     AND o08t1.shortr08 = r08t1.shortr08
     AND o08t1.shortr08 = r23t1.shortr08
     AND o08t1.shortl62 = l62t1.shortl62
     AND o08t1.partno = dwp.itemno
     AND o08t1.partrev = dwp.bucodsup
     AND o40t2.ocarrno = cpuw.ocarrno
     AND o40t2.ocarrno = o42t2.ocarrno
     AND o40t2.ecarrno = tu.CPU (+)
     AND r08t1.tripstat NOT IN ('0',
                                '1',
                                '22')
     AND o08t1.shortl62 = tbl2.sysshort(+)
     AND o06t1.ordno = o04t1.ordno
     AND r23t1.shortr23 = o06t1.shortr23
     AND o40t2.stato40 NOT IN ('85',
                               '0')
     AND r08t1.oppdate >= sysdate -1
     AND r08t1.routeno LIKE 'SCAR%'
   GROUP BY r08t1.oppdate,
            r08t1.shortr08,
            r23t1.r23extid,
            r23t1.deladr,
            r08t1.routeno,
            r08t1.etripid,
            r08t1.tripno,
            o08t1.shorto08,
            o04t1.deladr,
            o04t1.regdate,
            o04t1.deldate,
            o04t1.ordno,
            o04t1.eorderid,
            o40t2.ecarrno,
            o08t1.wordref,
            o04t90.cstate,
            o04t90.delstate,
            o04t90.delphon1,
            o04t90.delphon2,
            o04t90.TRSPMSG,
            o04t90.TRSPMSG2,
            o04t2.CUSTNAM1,
            o04t2.CUSTNAM2,
            o04t2.DELADR1,
            o04t2.DELPC,
            o04t2.DELCITY,
            o04t2.CUSTADR1,
            o04t2.CUSTPC,
            o04t2.CUSTCITY,
            o08t1.PARTNO,
            o08t1.PARTREV,
            o08t1.shortl62,
            o08t1.reqquant,
            o42t2.OCQUANT,
            dwp.numcp,
            l62t1.PARTDSC1,
            tu.dp,
            tu.weight,
            cpuw.weight,
            tbl2.freetext,
            adrBill.d10name1,
            adrBill.d10name2,
            adrBill.d50adrs1,
            adrBill.d50adrs2,
            adrBill.d50adrs3,
            adrBill.d50adrs4,
            adrBill.d50zipc,
            adrBill.d50city,
            adrBill.d50cntry,
            adrBill.d50state,
            adrBill.d50phone,
            adrDel.d10name1,
            adrDel.d10name2,
            adrDel.d50adrs1,
            adrDel.d50adrs2,
            adrDel.d50adrs3,
            adrDel.d50adrs4,
            adrDel.d50zipc,
            adrDel.d50city,
            adrDel.d50cntry,
            adrDel.d50state,
            adrDel.d50phone,
            CASE
                WHEN o08t1.mha IN ('11P2',
                                   '11P6',
                                   '11P7') THEN 'Box'
                ELSE 'Pallet'
            END,
            CASE
                WHEN dwp.numcp >1 THEN 'Multi-Box Item - ' || dwp.numcp || ' boxes'
                WHEN o08t1.mha IN ('11P2',
                                   '11P6',
                                   '11P7') THEN 'Packed in Box'
                ELSE ' '
            END,
            o40t2.stato40
   ORDER BY r08t1.oppdate,
            o04t1.eorderid,
            o08t1.partno,
            o08t1.partrev)