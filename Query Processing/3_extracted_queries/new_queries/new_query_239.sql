SELECT DISTINCT to_char(l16.datreg, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') datreg,
                TRIM(l16.l16seqno) l16seqno,
                TRIM(l16.logguser) logguser,
                TRIM(l16.l16lcode) l16lcode,
                TRIM(l16.l46adr) l46adr,
                TRIM(l16.admunit) admunit,
                TRIM(l16.partno) partno,
                TRIM(l16.partrev) partrev,
                TRIM(l16.divcode) divcode,
                TRIM(l16.shortl62) shortl62,
                TRIM(l16.ordno) ordno,
                TRIM(l16.ordseqno) ordseqno,
                TRIM(l16.ordline) ordline,
                TRIM(l16.ordtype) ordtype,
                TRIM(l16.shorto08) shorto08,
                CASE
                    WHEN l16.oppdate = '01-Jan-1900' THEN NULL
                    ELSE to_char(l16.oppdate, 'YYYY-MM-DD')
                END oppdate,
                TRIM(l16.routeno) routeno,
                TRIM(l16.tripno) tripno,
                TRIM(l16.shortr08) shortr08,
                TRIM(l16.carrno) carrno,
                TRIM(l16.ecarrno) ecarrno,
                TRIM(l16.ldct) ldct,
                TRIM(l16.lotid) lotid,
                TRIM(l16.ocarrno) ocarrno,
                TRIM(l16.shorto42) shorto42,
                TRIM(l16.ocarrtyp) ocarrtyp,
                TRIM(l16.l48boxid) l48boxid,
                TRIM(l16.pickrno) pickrno,
                TRIM(l16.l16qty) l16qty,
                TRIM(l16.l16wght) l16wght,
                TRIM(l16.l16vol) l16vol,
                TRIM(l16.fmha) fmha,
                TRIM(l16.frack) frack,
                TRIM(l16.fhorcoor) fhorcoor,
                TRIM(l16.fvercoor) fvercoor,
                TRIM(l16.mha) mha,
                TRIM(l16.rack) rack,
                TRIM(l16.horcoor) horcoor,
                TRIM(l16.vercoor) vercoor,
                TRIM(l16.l48pickl) l48pickl,
                TRIM(l16.l48donel) l48donel,
                TRIM(l16.l49func) l49func,
                TRIM(l16.startc) startc,
                TRIM(l16.onoff) onoff,
                TRIM(l16.x08seqno) x08seqno,
                TRIM(l16.divgroup) divgroup,
                TRIM(l16.l49empt) l49empt,
                TRIM(l16.l49selt) l49selt,
                TRIM(l16.l49trpt) l49trpt,
                TRIM(l16.l49putt) l49putt,
                TRIM(l16.l49selp) l49selp,
                TRIM(l16.l49expd) l49expd,
                TRIM(l16.l54movet) l54movet,
                TRIM(l16.l16itime) l16itime,
                TRIM(l16.l16flex) l16flex,
                TRIM(l16.l16flexa) l16flexa,
                TRIM(l16.l16destc) l16destc,
                TRIM(l16.l54uniq) l54uniq,
                TRIM(l16.l16movef) l16movef,
                TRIM(l16.l16empty) l16empty,
                TRIM(l16.inordno) inordno,
                TRIM(l16.shortg02) shortg02,
                TRIM(l16.shortg07) shortg07,
                TRIM(l16.consign) consign,
                TRIM(l16.shortg04) shortg04,
                TRIM(l16.gadmunit) gadmunit,
                TRIM(l16.cycle) CYCLE,
                                TRIM(l16.emha) emha,
                                TRIM(l16.l49bpst) l49bpst,
                                TRIM(l16.l49bptt) l49bptt,
                                TRIM(l16.l49bppt) l49bppt,
                                TRIM(l16.l49bplt) l49bplt,
                                TRIM(l16.g08stort) g08stort,
                                TRIM(l16.shortg30) shortg30,
                                TRIM(l16.shortg32) shortg32,
                                TRIM(l16.shortg36) shortg36,
                                TRIM(l16.o40pickd) o40pickd,
                                TRIM(l16.l16pecno) l16pecno,
                                TRIM(l16.ldctx) ldctx,
                                TRIM(l16.ldcty) ldcty,
                                TRIM(l16.ldctz) ldctz,
                                TRIM(l16.carrtype) carrtype,
                                TRIM(l16.l16delid) l16delid,
                                TRIM(l16.l16eorderid) l16eorderid,
                                TRIM(l16.l16etripid) l16etripid,
                                TRIM(l16.wzone) wzone,
                                TRIM(l16.pzone) pzone,
                                TRIM(l16.uzone) uzone,
                                TRIM(l16.fzone) fzone,
                                TRIM(l16.tzone) tzone,
                                TRIM(l16.l16mtc) l16mtc,
                                TRIM(l16.reascode) reascode,
                                TRIM(l16.l91batch) l91batch,
                                TRIM(l16.sortmha) sortmha,
                                TRIM(l16.l54crrsn) l54crrsn,
                                TRIM(l16.l16leadtime) l16leadtime,
                                TRIM(l62.partgrp8) partgrp8,
                                TRIM(l62.partgrp9) partgrp9,
                                TRIM(l62.partunit) partunit,
                                TRIM(l00_from.mhatype) from_mha_type,
                                TRIM(l30_from.loctype) from_loc_type,
                                TRIM(l00_to.mhatype) to_mha_type,
                                TRIM(l30_to.loctype) to_loc_type,
                                TRIM(l47.l47desc) l47desc,
                                TRIM(l47.l47clphy) l47clphy,
                                TRIM(ast017.dwpactmp.mpqty) mpqty,
                                TRIM(ast017.dwpactul.ulqty) ulqty,
                                TRIM(ast017.dwpact.scnetvol) scnetvol,
                                CASE
                                    WHEN l16.divcode = '017' THEN to_char(l16.shortr08)
                                    ELSE TRIM(l16.l16etripid)
                                END outbound_shipment,
                                TRIM(r23.rcvbucod)|| '-'|| TRIM(r23.rcvbutyp)|| '-'|| TRIM(r23.rcvbuadr) outbound_consignee,
                                TRIM(r23.luid) outbound_luid,
                                TRIM(g049.bucodecr)|| '-'|| TRIM(g049.butypecr)|| '-'|| TRIM(g049.icsmno) inbound_consignment,
                                TRIM(ast017.g30t93.bucodecr)|| '-'|| TRIM(ast017.g30t93.butypecr) || '-' || TRIM(ast017.g30t93.shpno) inbound_shipment,
                                TRIM(ast017.g30t90.luid) inbound_luid,
                                TRIM(ast017.dwpkey.itemtype) itemtype,
                                TRIM(ast017.dwpkey.reqdwpno) reqdwpno,
                                TRIM(ast017.dwpkey.reqdwped) reqdwped,
                                TRIM(ast017.dwpkey.bucodsup) bucodsup,
                                TRIM(ast017.dwpkey.butypsup) butypsup,
                                to_char(ast017.dwpkey.fpacdate, 'YYYY-MM-DD') fpacdate,
                                NULL oldqty,
                                     NULL delamo,
                                          NULL amooncr
FROM ast017.l16t3 l16
LEFT JOIN ast017.l62t1 l62 ON l16.shortl62 = l62.shortl62
LEFT JOIN ast017.l62t99 ON l62.partno = ast017.l62t99.partno
AND l62.partrev = ast017.l62t99.partrev
AND l62.divcode = ast017.l62t99.divcode
LEFT JOIN ast017.g08t1 g08 ON l16.carrno = g08.carrno
LEFT JOIN ast017.g08t90 ON g08.carrno = ast017.g08t90.carrno
LEFT JOIN ast017.dwpkey ON ast017.g08t90.shortdwp = ast017.dwpkey.shortdwp
LEFT JOIN ast017.dwpact ON ast017.dwpkey.itemno = ast017.dwpact.itemno
AND ast017.dwpkey.itemtype = ast017.dwpact.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpact.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpact.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpact.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpact.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpact.fpacdate
LEFT JOIN ast017.dwpactmp ON ast017.dwpkey.itemno = ast017.dwpactmp.itemno
AND ast017.dwpkey.itemtype = ast017.dwpactmp.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpactmp.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpactmp.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpactmp.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpactmp.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpactmp.fpacdate
LEFT JOIN ast017.dwpactul ON ast017.dwpkey.itemno = ast017.dwpactul.itemno
AND ast017.dwpkey.itemtype = ast017.dwpactul.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpactul.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpactul.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpactul.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpactul.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpactul.fpacdate
LEFT JOIN ast017.l30t1 l30_to ON l16.mha = l30_to.mha
AND l16.rack = l30_to.rack
AND l16.horcoor = l30_to.horcoor
AND l16.vercoor = l30_to.vercoor
LEFT JOIN ast017.l30t1 l30_from ON l16.fmha = l30_from.mha
AND l16.frack = l30_from.rack
AND l16.fhorcoor = l30_from.horcoor
AND l16.fvercoor = l30_from.vercoor
LEFT JOIN ast017.o40t2 o40 ON l16.ocarrno = o40.ocarrno
LEFT JOIN ast017.r23t90 r23 ON o40.shortr23 = r23.shortr23
LEFT JOIN ast017.g32t90 g329 ON l16.shortg32 = g329.shortg32
LEFT JOIN ast017.g04t90 g049 ON g08.shortg04 = g049.shortg04
LEFT JOIN ast017.l00t1 l00_to ON l16.mha = l00_to.mha
LEFT JOIN ast017.l00t1 l00_from ON l16.fmha = l00_from.mha
LEFT JOIN ast017.l47t1 l47 ON l16.l46adr = l47.l46adr
LEFT JOIN ast017.r08t1 r08 ON l16.shortr08 = r08.shortr08
LEFT JOIN ast017.r02t90 r029 ON r08.routeno = r029.routeno
LEFT JOIN ast017.g30t93 ON ast017.g30t93.shortg30 = l16.shortg30
LEFT JOIN ast017.g30t90 ON ast017.g30t90.shortg30 = l16.shortg30
WHERE l16.datreg > TRUNC(sysdate-1)
  AND l16.datreg > TRUNC(sysdate-13)
  AND l16.l16lcode != 64
  AND l16.ocarrno = 0
  AND l16.carrno > 0
UNION
SELECT DISTINCT to_char(l16.datreg, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') datreg,
                TRIM(l16.l16seqno) l16seqno,
                TRIM(l16.logguser) logguser,
                TRIM(l16.l16lcode) l16lcode,
                TRIM(l16.l46adr) l46adr,
                TRIM(l16.admunit) admunit,
                TRIM(l16.partno) partno,
                TRIM(l16.partrev) partrev,
                TRIM(l16.divcode) divcode,
                TRIM(l16.shortl62) shortl62,
                TRIM(l16.ordno) ordno,
                TRIM(l16.ordseqno) ordseqno,
                TRIM(l16.ordline) ordline,
                TRIM(l16.ordtype) ordtype,
                TRIM(l16.shorto08) shorto08,
                CASE
                    WHEN l16.oppdate = '01-Jan-1900' THEN NULL
                    ELSE to_char(l16.oppdate, 'YYYY-MM-DD')
                END oppdate,
                TRIM(l16.routeno) routeno,
                TRIM(l16.tripno) tripno,
                TRIM(l16.shortr08) shortr08,
                TRIM(l16.carrno) carrno,
                TRIM(l16.ecarrno) ecarrno,
                TRIM(l16.ldct) ldct,
                TRIM(l16.lotid) lotid,
                TRIM(l16.ocarrno) ocarrno,
                TRIM(l16.shorto42) shorto42,
                TRIM(l16.ocarrtyp) ocarrtyp,
                TRIM(l16.l48boxid) l48boxid,
                TRIM(l16.pickrno) pickrno,
                TRIM(l16.l16qty) l16qty,
                TRIM(l16.l16wght) l16wght,
                TRIM(l16.l16vol) l16vol,
                TRIM(l16.fmha) fmha,
                TRIM(l16.frack) frack,
                TRIM(l16.fhorcoor) fhorcoor,
                TRIM(l16.fvercoor) fvercoor,
                TRIM(l16.mha) mha,
                TRIM(l16.rack) rack,
                TRIM(l16.horcoor) horcoor,
                TRIM(l16.vercoor) vercoor,
                TRIM(l16.l48pickl) l48pickl,
                TRIM(l16.l48donel) l48donel,
                TRIM(l16.l49func) l49func,
                TRIM(l16.startc) startc,
                TRIM(l16.onoff) onoff,
                TRIM(l16.x08seqno) x08seqno,
                TRIM(l16.divgroup) divgroup,
                TRIM(l16.l49empt) l49empt,
                TRIM(l16.l49selt) l49selt,
                TRIM(l16.l49trpt) l49trpt,
                TRIM(l16.l49putt) l49putt,
                TRIM(l16.l49selp) l49selp,
                TRIM(l16.l49expd) l49expd,
                TRIM(l16.l54movet) l54movet,
                TRIM(l16.l16itime) l16itime,
                TRIM(l16.l16flex) l16flex,
                TRIM(l16.l16flexa) l16flexa,
                TRIM(l16.l16destc) l16destc,
                TRIM(l16.l54uniq) l54uniq,
                TRIM(l16.l16movef) l16movef,
                TRIM(l16.l16empty) l16empty,
                TRIM(l16.inordno) inordno,
                TRIM(l16.shortg02) shortg02,
                TRIM(l16.shortg07) shortg07,
                TRIM(l16.consign) consign,
                TRIM(l16.shortg04) shortg04,
                TRIM(l16.gadmunit) gadmunit,
                TRIM(l16.cycle) CYCLE,
                                TRIM(l16.emha) emha,
                                TRIM(l16.l49bpst) l49bpst,
                                TRIM(l16.l49bptt) l49bptt,
                                TRIM(l16.l49bppt) l49bppt,
                                TRIM(l16.l49bplt) l49bplt,
                                TRIM(l16.g08stort) g08stort,
                                TRIM(l16.shortg30) shortg30,
                                TRIM(l16.shortg32) shortg32,
                                TRIM(l16.shortg36) shortg36,
                                TRIM(l16.o40pickd) o40pickd,
                                TRIM(l16.l16pecno) l16pecno,
                                TRIM(l16.ldctx) ldctx,
                                TRIM(l16.ldcty) ldcty,
                                TRIM(l16.ldctz) ldctz,
                                TRIM(l16.carrtype) carrtype,
                                TRIM(l16.l16delid) l16delid,
                                TRIM(l16.l16eorderid) l16eorderid,
                                TRIM(l16.l16etripid) l16etripid,
                                TRIM(l16.wzone) wzone,
                                TRIM(l16.pzone) pzone,
                                TRIM(l16.uzone) uzone,
                                TRIM(l16.fzone) fzone,
                                TRIM(l16.tzone) tzone,
                                TRIM(l16.l16mtc) l16mtc,
                                TRIM(l16.reascode) reascode,
                                TRIM(l16.l91batch) l91batch,
                                TRIM(l16.sortmha) sortmha,
                                TRIM(l16.l54crrsn) l54crrsn,
                                TRIM(l16.l16leadtime) l16leadtime,
                                TRIM(l62.partgrp8) partgrp8,
                                TRIM(l62.partgrp9) partgrp9,
                                TRIM(l62.partunit) partunit,
                                TRIM(l00_from.mhatype) from_mha_type,
                                TRIM(l30_from.loctype) from_loc_type,
                                TRIM(l00_to.mhatype) to_mha_type,
                                TRIM(l30_to.loctype) to_loc_type,
                                TRIM(l47.l47desc) l47desc,
                                TRIM(l47.l47clphy) l47clphy,
                                TRIM(ast017.dwpactmp.mpqty) mpqty,
                                TRIM(ast017.dwpactul.ulqty) ulqty,
                                TRIM(ast017.dwpact.scnetvol) scnetvol,
                                CASE
                                    WHEN l16.divcode = '017' THEN to_char(l16.shortr08)
                                    ELSE TRIM(l16.l16etripid)
                                END outbound_shipment,
                                TRIM(r23.rcvbucod)|| '-'|| TRIM(r23.rcvbutyp)|| '-'|| TRIM(r23.rcvbuadr) outbound_consignee,
                                TRIM(r23.luid) outbound_luid,
                                TRIM(g049.bucodecr)|| '-'|| TRIM(g049.butypecr)|| '-'|| TRIM(g049.icsmno) inbound_consignment,
                                TRIM(ast017.g30t93.bucodecr)|| '-'|| TRIM(ast017.g30t93.butypecr) || '-' || TRIM(ast017.g30t93.shpno) inbound_shipment,
                                TRIM(ast017.g30t90.luid) inbound_luid,
                                TRIM(ast017.dwpkey.itemtype) itemtype,
                                TRIM(ast017.dwpkey.reqdwpno) reqdwpno,
                                TRIM(ast017.dwpkey.reqdwped) reqdwped,
                                TRIM(ast017.dwpkey.bucodsup) bucodsup,
                                TRIM(ast017.dwpkey.butypsup) butypsup,
                                to_char(ast017.dwpkey.fpacdate, 'YYYY-MM-DD') fpacdate,
                                NULL oldqty,
                                     NULL delamo,
                                          NULL amooncr
FROM ast017.l16t3 l16
LEFT JOIN ast017.l62t1 l62 ON l16.shortl62 = l62.shortl62
LEFT JOIN ast017.l62t99 ON l62.partno = ast017.l62t99.partno
AND l62.partrev = ast017.l62t99.partrev
AND l62.divcode = ast017.l62t99.divcode
LEFT JOIN ast017.g08t1 g08 ON l16.carrno = g08.carrno
LEFT JOIN ast017.o42t90 ON l16.shorto42 = ast017.o42t90.shorto42
LEFT JOIN ast017.dwpkey ON ast017.o42t90.shortdwp = ast017.dwpkey.shortdwp
LEFT JOIN ast017.dwpact ON ast017.dwpkey.itemno = ast017.dwpact.itemno
AND ast017.dwpkey.itemtype = ast017.dwpact.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpact.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpact.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpact.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpact.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpact.fpacdate
LEFT JOIN ast017.dwpactmp ON ast017.dwpkey.itemno = ast017.dwpactmp.itemno
AND ast017.dwpkey.itemtype = ast017.dwpactmp.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpactmp.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpactmp.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpactmp.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpactmp.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpactmp.fpacdate
LEFT JOIN ast017.dwpactul ON ast017.dwpkey.itemno = ast017.dwpactul.itemno
AND ast017.dwpkey.itemtype = ast017.dwpactul.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpactul.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpactul.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpactul.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpactul.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpactul.fpacdate
LEFT JOIN ast017.l30t1 l30_to ON l16.mha = l30_to.mha
AND l16.rack = l30_to.rack
AND l16.horcoor = l30_to.horcoor
AND l16.vercoor = l30_to.vercoor
LEFT JOIN ast017.l30t1 l30_from ON l16.fmha = l30_from.mha
AND l16.frack = l30_from.rack
AND l16.fhorcoor = l30_from.horcoor
AND l16.fvercoor = l30_from.vercoor
LEFT JOIN ast017.o40t2 o40 ON l16.ocarrno = o40.ocarrno
LEFT JOIN ast017.r23t90 r23 ON o40.shortr23 = r23.shortr23
LEFT JOIN ast017.g32t90 g329 ON l16.shortg32 = g329.shortg32
LEFT JOIN ast017.g04t90 g049 ON g08.shortg04 = g049.shortg04
LEFT JOIN ast017.l00t1 l00_to ON l16.mha = l00_to.mha
LEFT JOIN ast017.l00t1 l00_from ON l16.fmha = l00_from.mha
LEFT JOIN ast017.l47t1 l47 ON l16.l46adr = l47.l46adr
LEFT JOIN ast017.r08t1 r08 ON l16.shortr08 = r08.shortr08
LEFT JOIN ast017.r02t90 r029 ON r08.routeno = r029.routeno
LEFT JOIN ast017.g30t93 ON ast017.g30t93.shortg30 = l16.shortg30
LEFT JOIN ast017.g30t90 ON ast017.g30t90.shortg30 = l16.shortg30
WHERE l16.datreg > TRUNC(sysdate-1)
  AND l16.datreg > TRUNC(sysdate-13)
  AND l16.l16lcode != 64
  AND l16.ocarrno > 0
  AND l16.carrno = 0
UNION
SELECT DISTINCT to_char(l16.datreg, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') datreg,
                TRIM(l16.l16seqno) l16seqno,
                TRIM(l16.logguser) logguser,
                TRIM(l16.l16lcode) l16lcode,
                TRIM(l16.l46adr) l46adr,
                TRIM(l16.admunit) admunit,
                TRIM(l16.partno) partno,
                TRIM(l16.partrev) partrev,
                TRIM(l16.divcode) divcode,
                TRIM(l16.shortl62) shortl62,
                TRIM(l16.ordno) ordno,
                TRIM(l16.ordseqno) ordseqno,
                TRIM(l16.ordline) ordline,
                TRIM(l16.ordtype) ordtype,
                TRIM(l16.shorto08) shorto08,
                CASE
                    WHEN l16.oppdate = '01-Jan-1900' THEN NULL
                    ELSE to_char(l16.oppdate, 'YYYY-MM-DD')
                END oppdate,
                TRIM(l16.routeno) routeno,
                TRIM(l16.tripno) tripno,
                TRIM(l16.shortr08) shortr08,
                TRIM(l16.carrno) carrno,
                TRIM(l16.ecarrno) ecarrno,
                TRIM(l16.ldct) ldct,
                TRIM(l16.lotid) lotid,
                TRIM(l16.ocarrno) ocarrno,
                TRIM(l16.shorto42) shorto42,
                TRIM(l16.ocarrtyp) ocarrtyp,
                TRIM(l16.l48boxid) l48boxid,
                TRIM(l16.pickrno) pickrno,
                TRIM(l16.l16qty) l16qty,
                TRIM(l16.l16wght) l16wght,
                TRIM(l16.l16vol) l16vol,
                TRIM(l16.fmha) fmha,
                TRIM(l16.frack) frack,
                TRIM(l16.fhorcoor) fhorcoor,
                TRIM(l16.fvercoor) fvercoor,
                TRIM(l16.mha) mha,
                TRIM(l16.rack) rack,
                TRIM(l16.horcoor) horcoor,
                TRIM(l16.vercoor) vercoor,
                TRIM(l16.l48pickl) l48pickl,
                TRIM(l16.l48donel) l48donel,
                TRIM(l16.l49func) l49func,
                TRIM(l16.startc) startc,
                TRIM(l16.onoff) onoff,
                TRIM(l16.x08seqno) x08seqno,
                TRIM(l16.divgroup) divgroup,
                TRIM(l16.l49empt) l49empt,
                TRIM(l16.l49selt) l49selt,
                TRIM(l16.l49trpt) l49trpt,
                TRIM(l16.l49putt) l49putt,
                TRIM(l16.l49selp) l49selp,
                TRIM(l16.l49expd) l49expd,
                TRIM(l16.l54movet) l54movet,
                TRIM(l16.l16itime) l16itime,
                TRIM(l16.l16flex) l16flex,
                TRIM(l16.l16flexa) l16flexa,
                TRIM(l16.l16destc) l16destc,
                TRIM(l16.l54uniq) l54uniq,
                TRIM(l16.l16movef) l16movef,
                TRIM(l16.l16empty) l16empty,
                TRIM(l16.inordno) inordno,
                TRIM(l16.shortg02) shortg02,
                TRIM(l16.shortg07) shortg07,
                TRIM(l16.consign) consign,
                TRIM(l16.shortg04) shortg04,
                TRIM(l16.gadmunit) gadmunit,
                TRIM(l16.cycle) CYCLE,
                                TRIM(l16.emha) emha,
                                TRIM(l16.l49bpst) l49bpst,
                                TRIM(l16.l49bptt) l49bptt,
                                TRIM(l16.l49bppt) l49bppt,
                                TRIM(l16.l49bplt) l49bplt,
                                TRIM(l16.g08stort) g08stort,
                                TRIM(l16.shortg30) shortg30,
                                TRIM(l16.shortg32) shortg32,
                                TRIM(l16.shortg36) shortg36,
                                TRIM(l16.o40pickd) o40pickd,
                                TRIM(l16.l16pecno) l16pecno,
                                TRIM(l16.ldctx) ldctx,
                                TRIM(l16.ldcty) ldcty,
                                TRIM(l16.ldctz) ldctz,
                                TRIM(l16.carrtype) carrtype,
                                TRIM(l16.l16delid) l16delid,
                                TRIM(l16.l16eorderid) l16eorderid,
                                TRIM(l16.l16etripid) l16etripid,
                                TRIM(l16.wzone) wzone,
                                TRIM(l16.pzone) pzone,
                                TRIM(l16.uzone) uzone,
                                TRIM(l16.fzone) fzone,
                                TRIM(l16.tzone) tzone,
                                TRIM(l16.l16mtc) l16mtc,
                                TRIM(l16.reascode) reascode,
                                TRIM(l16.l91batch) l91batch,
                                TRIM(l16.sortmha) sortmha,
                                TRIM(l16.l54crrsn) l54crrsn,
                                TRIM(l16.l16leadtime) l16leadtime,
                                TRIM(l62.partgrp8) partgrp8,
                                TRIM(l62.partgrp9) partgrp9,
                                TRIM(l62.partunit) partunit,
                                TRIM(l00_from.mhatype) from_mha_type,
                                TRIM(l30_from.loctype) from_loc_type,
                                TRIM(l00_to.mhatype) to_mha_type,
                                TRIM(l30_to.loctype) to_loc_type,
                                TRIM(l47.l47desc) l47desc,
                                TRIM(l47.l47clphy) l47clphy,
                                TRIM(ast017.dwpactmp.mpqty) mpqty,
                                TRIM(ast017.dwpactul.ulqty) ulqty,
                                TRIM(ast017.dwpact.scnetvol) scnetvol,
                                CASE
                                    WHEN l16.divcode = '017' THEN to_char(l16.shortr08)
                                    ELSE TRIM(l16.l16etripid)
                                END outbound_shipment,
                                TRIM(r23.rcvbucod)|| '-'|| TRIM(r23.rcvbutyp)|| '-'|| TRIM(r23.rcvbuadr) outbound_consignee,
                                TRIM(r23.luid) outbound_luid,
                                TRIM(g049.bucodecr)|| '-'|| TRIM(g049.butypecr)|| '-'|| TRIM(g049.icsmno) inbound_consignment,
                                TRIM(ast017.g30t93.bucodecr)|| '-'|| TRIM(ast017.g30t93.butypecr) || '-' || TRIM(ast017.g30t93.shpno) inbound_shipment,
                                TRIM(ast017.g30t90.luid) inbound_luid,
                                TRIM(ast017.dwpkey.itemtype) itemtype,
                                TRIM(ast017.dwpkey.reqdwpno) reqdwpno,
                                TRIM(ast017.dwpkey.reqdwped) reqdwped,
                                TRIM(ast017.dwpkey.bucodsup) bucodsup,
                                TRIM(ast017.dwpkey.butypsup) butypsup,
                                to_char(ast017.dwpkey.fpacdate, 'YYYY-MM-DD') fpacdate,
                                NULL oldqty,
                                     NULL delamo,
                                          NULL amooncr
FROM ast017.l16t3 l16
LEFT JOIN ast017.l62t1 l62 ON l16.shortl62 = l62.shortl62
LEFT JOIN ast017.l62t99 ON l62.partno = ast017.l62t99.partno
AND l62.partrev = ast017.l62t99.partrev
AND l62.divcode = ast017.l62t99.divcode
LEFT JOIN ast017.g08t1 g08 ON l16.carrno = g08.carrno
LEFT JOIN ast017.o42t90 ON l16.shorto42 = ast017.o42t90.shorto42
LEFT JOIN ast017.dwpkey ON ast017.o42t90.shortdwp = ast017.dwpkey.shortdwp
LEFT JOIN ast017.dwpact ON ast017.dwpkey.itemno = ast017.dwpact.itemno
AND ast017.dwpkey.itemtype = ast017.dwpact.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpact.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpact.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpact.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpact.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpact.fpacdate
LEFT JOIN ast017.dwpactmp ON ast017.dwpkey.itemno = ast017.dwpactmp.itemno
AND ast017.dwpkey.itemtype = ast017.dwpactmp.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpactmp.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpactmp.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpactmp.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpactmp.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpactmp.fpacdate
LEFT JOIN ast017.dwpactul ON ast017.dwpkey.itemno = ast017.dwpactul.itemno
AND ast017.dwpkey.itemtype = ast017.dwpactul.itemtype
AND ast017.dwpkey.reqdwpno = ast017.dwpactul.reqdwpno
AND ast017.dwpkey.reqdwped = ast017.dwpactul.reqdwped
AND ast017.dwpkey.bucodsup = ast017.dwpactul.bucodsup
AND ast017.dwpkey.butypsup = ast017.dwpactul.butypsup
AND ast017.dwpkey.fpacdate = ast017.dwpactul.fpacdate
LEFT JOIN ast017.l30t1 l30_to ON l16.mha = l30_to.mha
AND l16.rack = l30_to.rack
AND l16.horcoor = l30_to.horcoor
AND l16.vercoor = l30_to.vercoor
LEFT JOIN ast017.l30t1 l30_from ON l16.fmha = l30_from.mha
AND l16.frack = l30_from.rack
AND l16.fhorcoor = l30_from.horcoor
AND l16.fvercoor = l30_from.vercoor
LEFT JOIN ast017.o40t2 o40 ON l16.ocarrno = o40.ocarrno
LEFT JOIN ast017.r23t90 r23 ON o40.shortr23 = r23.shortr23
LEFT JOIN ast017.g32t90 g329 ON l16.shortg32 = g329.shortg32
LEFT JOIN ast017.g04t90 g049 ON g08.shortg04 = g049.shortg04
LEFT JOIN ast017.l00t1 l00_to ON l16.mha = l00_to.mha
LEFT JOIN ast017.l00t1 l00_from ON l16.fmha = l00_from.mha
LEFT JOIN ast017.l47t1 l47 ON l16.l46adr = l47.l46adr
LEFT JOIN ast017.r08t1 r08 ON l16.shortr08 = r08.shortr08
LEFT JOIN ast017.r02t90 r029 ON r08.routeno = r029.routeno
LEFT JOIN ast017.g30t93 ON ast017.g30t93.shortg30 = l16.shortg30
LEFT JOIN ast017.g30t90 ON ast017.g30t90.shortg30 = l16.shortg30
WHERE l16.datreg > TRUNC(sysdate-1)
  AND l16.datreg > TRUNC(sysdate-13)
  AND l16.l16lcode != 64
  AND l16.ocarrno > 0
  AND l16.carrno > 0
UNION
SELECT DISTINCT to_char(l16.datreg, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') datreg,
                TRIM(l16.l16seqno) l16seqno,
                TRIM(l16.logguser) logguser,
                TRIM(l16.l16lcode) l16lcode,
                TRIM(l16.l46adr) l46adr,
                TRIM(l16.admunit) admunit,
                TRIM(l16.partno) partno,
                TRIM(l16.partrev) partrev,
                TRIM(l16.divcode) divcode,
                TRIM(l16.shortl62) shortl62,
                TRIM(l16.ordno) ordno,
                TRIM(l16.ordseqno) ordseqno,
                TRIM(l16.ordline) ordline,
                TRIM(l16.ordtype) ordtype,
                TRIM(l16.shorto08) shorto08,
                CASE
                    WHEN l16.oppdate = '01-Jan-1900' THEN NULL
                    ELSE to_char(l16.oppdate, 'YYYY-MM-DD')
                END oppdate,
                TRIM(l16.routeno) routeno,
                TRIM(l16.tripno) tripno,
                TRIM(l16.shortr08) shortr08,
                TRIM(l16.carrno) carrno,
                TRIM(l16.ecarrno) ecarrno,
                TRIM(l16.ldct) ldct,
                TRIM(l16.lotid) lotid,
                TRIM(l16.ocarrno) ocarrno,
                TRIM(l16.shorto42) shorto42,
                TRIM(l16.ocarrtyp) ocarrtyp,
                TRIM(l16.l48boxid) l48boxid,
                TRIM(l16.pickrno) pickrno,
                TRIM(l16.l16qty) l16qty,
                TRIM(l16.l16wght) l16wght,
                TRIM(l16.l16vol) l16vol,
                TRIM(l16.fmha) fmha,
                TRIM(l16.frack) frack,
                TRIM(l16.fhorcoor) fhorcoor,
                TRIM(l16.fvercoor) fvercoor,
                TRIM(l16.mha) mha,
                TRIM(l16.rack) rack,
                TRIM(l16.horcoor) horcoor,
                TRIM(l16.vercoor) vercoor,
                TRIM(l16.l48pickl) l48pickl,
                TRIM(l16.l48donel) l48donel,
                TRIM(l16.l49func) l49func,
                TRIM(l16.startc) startc,
                TRIM(l16.onoff) onoff,
                TRIM(l16.x08seqno) x08seqno,
                TRIM(l16.divgroup) divgroup,
                TRIM(l16.l49empt) l49empt,
                TRIM(l16.l49selt) l49selt,
                TRIM(l16.l49trpt) l49trpt,
                TRIM(l16.l49putt) l49putt,
                TRIM(l16.l49selp) l49selp,
                TRIM(l16.l49expd) l49expd,
                TRIM(l16.l54movet) l54movet,
                TRIM(l16.l16itime) l16itime,
                TRIM(l16.l16flex) l16flex,
                TRIM(l16.l16flexa) l16flexa,
                TRIM(l16.l16destc) l16destc,
                TRIM(l16.l54uniq) l54uniq,
                TRIM(l16.l16movef) l16movef,
                TRIM(l16.l16empty) l16empty,
                TRIM(l16.inordno) inordno,
                TRIM(l16.shortg02) shortg02,
                TRIM(l16.shortg07) shortg07,
                TRIM(l16.consign) consign,
                TRIM(l16.shortg04) shortg04,
                TRIM(l16.gadmunit) gadmunit,
                TRIM(l16.cycle) CYCLE,
                                TRIM(l16.emha) emha,
                                TRIM(l16.l49bpst) l49bpst,
                                TRIM(l16.l49bptt) l49bptt,
                                TRIM(l16.l49bppt) l49bppt,
                                TRIM(l16.l49bplt) l49bplt,
                                TRIM(l16.g08stort) g08stort,
                                TRIM(l16.shortg30) shortg30,
                                TRIM(l16.shortg32) shortg32,
                                TRIM(l16.shortg36) shortg36,
                                TRIM(l16.o40pickd) o40pickd,
                                TRIM(l16.l16pecno) l16pecno,
                                TRIM(l16.ldctx) ldctx,
                                TRIM(l16.ldcty) ldcty,
                                TRIM(l16.ldctz) ldctz,
                                TRIM(l16.carrtype) carrtype,
                                TRIM(l16.l16delid) l16delid,
                                TRIM(l16.l16eorderid) l16eorderid,
                                TRIM(l16.l16etripid) l16etripid,
                                TRIM(l16.wzone) wzone,
                                TRIM(l16.pzone) pzone,
                                TRIM(l16.uzone) uzone,
                                TRIM(l16.fzone) fzone,
                                TRIM(l16.tzone) tzone,
                                TRIM(l16.l16mtc) l16mtc,
                                TRIM(l16.reascode) reascode,
                                TRIM(l16.l91batch) l91batch,
                                TRIM(l16.sortmha) sortmha,
                                TRIM(l16.l54crrsn) l54crrsn,
                                TRIM(l16.l16leadtime) l16leadtime,
                                TRIM(l62.partgrp8) partgrp8,
                                TRIM(l62.partgrp9) partgrp9,
                                TRIM(l62.partunit) partunit,
                                TRIM(l00_from.mhatype) from_mha_type,
                                TRIM(l30_from.loctype) from_loc_type,
                                TRIM(l00_to.mhatype) to_mha_type,
                                TRIM(l30_to.loctype) to_loc_type,
                                TRIM(l47.l47desc) l47desc,
                                TRIM(l47.l47clphy) l47clphy,
                                TRIM(ast017.dwpactmp.mpqty) mpqty,
                                TRIM(ast017.dwpactul.ulqty) ulqty,
                                TRIM(ast017.dwpact.scnetvol) scnetvol,
                                CASE
                                    WHEN l16.divcode = '017' THEN to_char(l16.shortr08)
                                    ELSE TRIM(l16.l16etripid)
                                END outbound_shipment,
                                TRIM(r23.rcvbucod)|| '-'|| TRIM(r23.rcvbutyp)|| '-'|| TRIM(r23.rcvbuadr) outbound_consignee,
                                TRIM(r23.luid) outbound_luid,
                                TRIM(g049.bucodecr)|| '-'|| TRIM(g049.butypecr)|| '-'|| TRIM(g049.icsmno) inbound_consignment,
                                TRIM(ast017.g30t93.bucodecr)|| '-'|| TRIM(ast017.g30t93.butypecr) || '-' || TRIM(ast017.g30t93.