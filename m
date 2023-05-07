Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DC5258
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683479979; x=1715015979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ta28aWkjmMwc8rgceF6bc2mUiACX1QXvM2OZ3wcajjw=;
  b=cI22sQPguwxPHg+PKx0tpk2rY8obxj60hTeU3PzXJ0L7l0SioaHHpFNO
   vwxNX207bzpO4QZl9eO6q7D4bwGUBLaQV3+y1PyU7lU+nQp7dFsmOfUa2
   jO0V5vp/T5Y7lnDgxa4/PZKllsIn2pn3v/h61R7OGzWnamRvteCaqT8GA
   VRoIoHewvtM2kStQ/zjX/i/YL93PCzZeq9WKq8HuO2DKHw+skmPomRPnt
   4ogaOYZ3plBggidCex44xrWC0eRTRx9/VC8f9kYoSefVMuVaz9hq78B4M
   F3cW/JuvtXlegUGuG9fPvSy9A8OcrIrBR8cNobTEotPBaISC8Q8Iw5pSn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435820134"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="435820134"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 10:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="648605986"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="648605986"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 May 2023 10:19:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvi2q-0000p7-0V;
	Sun, 07 May 2023 17:19:36 +0000
Date: Mon, 8 May 2023 01:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/zstd/compress/zstd_lazy.c:1605 ZSTD_compressBlock_lazy_generic()
 warn: Function too hairy.  No more merges.
Message-ID: <202305080110.wWXvxYPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Terrell <terrelln@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc4354c6e5c21257cf4a50b32f7c11c7d65c55b3
commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f zstd: import usptream v1.5.2
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: ia64-randconfig-m031-20230507 (https://download.01.org/0day-ci/archive/20230508/202305080110.wWXvxYPZ-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305080110.wWXvxYPZ-lkp@intel.com/

New smatch warnings:
lib/zstd/compress/zstd_lazy.c:1605 ZSTD_compressBlock_lazy_generic() warn: Function too hairy.  No more merges.

Old smatch warnings:
lib/zstd/compress/zstd_lazy.c:1577 ZSTD_compressBlock_lazy_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1915 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1937 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1947 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1979 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2026 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented

vim +1605 lib/zstd/compress/zstd_lazy.c

e0c1b49f5b674c Nick Terrell 2020-09-11  1474  
e0c1b49f5b674c Nick Terrell 2020-09-11  1475  FORCE_INLINE_TEMPLATE size_t
e0c1b49f5b674c Nick Terrell 2020-09-11  1476  ZSTD_compressBlock_lazy_generic(
e0c1b49f5b674c Nick Terrell 2020-09-11  1477                          ZSTD_matchState_t* ms, seqStore_t* seqStore,
e0c1b49f5b674c Nick Terrell 2020-09-11  1478                          U32 rep[ZSTD_REP_NUM],
e0c1b49f5b674c Nick Terrell 2020-09-11  1479                          const void* src, size_t srcSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  1480                          const searchMethod_e searchMethod, const U32 depth,
e0c1b49f5b674c Nick Terrell 2020-09-11  1481                          ZSTD_dictMode_e const dictMode)
e0c1b49f5b674c Nick Terrell 2020-09-11  1482  {
e0c1b49f5b674c Nick Terrell 2020-09-11  1483      const BYTE* const istart = (const BYTE*)src;
e0c1b49f5b674c Nick Terrell 2020-09-11  1484      const BYTE* ip = istart;
e0c1b49f5b674c Nick Terrell 2020-09-11  1485      const BYTE* anchor = istart;
e0c1b49f5b674c Nick Terrell 2020-09-11  1486      const BYTE* const iend = istart + srcSize;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1487      const BYTE* const ilimit = (searchMethod == search_rowHash) ? iend - 8 - ZSTD_ROW_HASH_CACHE_SIZE : iend - 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  1488      const BYTE* const base = ms->window.base;
e0c1b49f5b674c Nick Terrell 2020-09-11  1489      const U32 prefixLowestIndex = ms->window.dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  1490      const BYTE* const prefixLowest = base + prefixLowestIndex;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1491      const U32 mls = BOUNDED(4, ms->cParams.minMatch, 6);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1492      const U32 rowLog = BOUNDED(4, ms->cParams.searchLog, 6);
e0c1b49f5b674c Nick Terrell 2020-09-11  1493  
e0c1b49f5b674c Nick Terrell 2020-09-11  1494      U32 offset_1 = rep[0], offset_2 = rep[1], savedOffset=0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1495  
e0c1b49f5b674c Nick Terrell 2020-09-11  1496      const int isDMS = dictMode == ZSTD_dictMatchState;
e0c1b49f5b674c Nick Terrell 2020-09-11  1497      const int isDDS = dictMode == ZSTD_dedicatedDictSearch;
e0c1b49f5b674c Nick Terrell 2020-09-11  1498      const int isDxS = isDMS || isDDS;
e0c1b49f5b674c Nick Terrell 2020-09-11  1499      const ZSTD_matchState_t* const dms = ms->dictMatchState;
e0c1b49f5b674c Nick Terrell 2020-09-11  1500      const U32 dictLowestIndex      = isDxS ? dms->window.dictLimit : 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1501      const BYTE* const dictBase     = isDxS ? dms->window.base : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  1502      const BYTE* const dictLowest   = isDxS ? dictBase + dictLowestIndex : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  1503      const BYTE* const dictEnd      = isDxS ? dms->window.nextSrc : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  1504      const U32 dictIndexDelta       = isDxS ?
e0c1b49f5b674c Nick Terrell 2020-09-11  1505                                       prefixLowestIndex - (U32)(dictEnd - dictBase) :
e0c1b49f5b674c Nick Terrell 2020-09-11  1506                                       0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1507      const U32 dictAndPrefixLength = (U32)((ip - prefixLowest) + (dictEnd - dictLowest));
e0c1b49f5b674c Nick Terrell 2020-09-11  1508  
2aa14b1ab2c41a Nick Terrell 2022-10-17  1509      DEBUGLOG(5, "ZSTD_compressBlock_lazy_generic (dictMode=%u) (searchFunc=%u)", (U32)dictMode, (U32)searchMethod);
e0c1b49f5b674c Nick Terrell 2020-09-11  1510      ip += (dictAndPrefixLength == 0);
e0c1b49f5b674c Nick Terrell 2020-09-11  1511      if (dictMode == ZSTD_noDict) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1512          U32 const curr = (U32)(ip - base);
e0c1b49f5b674c Nick Terrell 2020-09-11  1513          U32 const windowLow = ZSTD_getLowestPrefixIndex(ms, curr, ms->cParams.windowLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  1514          U32 const maxRep = curr - windowLow;
e0c1b49f5b674c Nick Terrell 2020-09-11  1515          if (offset_2 > maxRep) savedOffset = offset_2, offset_2 = 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1516          if (offset_1 > maxRep) savedOffset = offset_1, offset_1 = 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1517      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1518      if (isDxS) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1519          /* dictMatchState repCode checks don't currently handle repCode == 0
e0c1b49f5b674c Nick Terrell 2020-09-11  1520           * disabling. */
e0c1b49f5b674c Nick Terrell 2020-09-11  1521          assert(offset_1 <= dictAndPrefixLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  1522          assert(offset_2 <= dictAndPrefixLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  1523      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1524  
2aa14b1ab2c41a Nick Terrell 2022-10-17  1525      if (searchMethod == search_rowHash) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1526          ZSTD_row_fillHashCache(ms, base, rowLog,
2aa14b1ab2c41a Nick Terrell 2022-10-17  1527                              MIN(ms->cParams.minMatch, 6 /* mls caps out at 6 */),
2aa14b1ab2c41a Nick Terrell 2022-10-17  1528                              ms->nextToUpdate, ilimit);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1529      }
2aa14b1ab2c41a Nick Terrell 2022-10-17  1530  
e0c1b49f5b674c Nick Terrell 2020-09-11  1531      /* Match Loop */
e0c1b49f5b674c Nick Terrell 2020-09-11  1532  #if defined(__x86_64__)
e0c1b49f5b674c Nick Terrell 2020-09-11  1533      /* I've measured random a 5% speed loss on levels 5 & 6 (greedy) when the
e0c1b49f5b674c Nick Terrell 2020-09-11  1534       * code alignment is perturbed. To fix the instability align the loop on 32-bytes.
e0c1b49f5b674c Nick Terrell 2020-09-11  1535       */
e0c1b49f5b674c Nick Terrell 2020-09-11  1536      __asm__(".p2align 5");
e0c1b49f5b674c Nick Terrell 2020-09-11  1537  #endif
e0c1b49f5b674c Nick Terrell 2020-09-11  1538      while (ip < ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1539          size_t matchLength=0;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1540          size_t offcode=STORE_REPCODE_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  1541          const BYTE* start=ip+1;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1542          DEBUGLOG(7, "search baseline (depth 0)");
e0c1b49f5b674c Nick Terrell 2020-09-11  1543  
e0c1b49f5b674c Nick Terrell 2020-09-11  1544          /* check repCode */
e0c1b49f5b674c Nick Terrell 2020-09-11  1545          if (isDxS) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1546              const U32 repIndex = (U32)(ip - base) + 1 - offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  1547              const BYTE* repMatch = ((dictMode == ZSTD_dictMatchState || dictMode == ZSTD_dedicatedDictSearch)
e0c1b49f5b674c Nick Terrell 2020-09-11  1548                                  && repIndex < prefixLowestIndex) ?
e0c1b49f5b674c Nick Terrell 2020-09-11  1549                                     dictBase + (repIndex - dictIndexDelta) :
e0c1b49f5b674c Nick Terrell 2020-09-11  1550                                     base + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  1551              if (((U32)((prefixLowestIndex-1) - repIndex) >= 3 /* intentional underflow */)
e0c1b49f5b674c Nick Terrell 2020-09-11  1552                  && (MEM_read32(repMatch) == MEM_read32(ip+1)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1553                  const BYTE* repMatchEnd = repIndex < prefixLowestIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  1554                  matchLength = ZSTD_count_2segments(ip+1+4, repMatch+4, iend, repMatchEnd, prefixLowest) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1555                  if (depth==0) goto _storeSequence;
e0c1b49f5b674c Nick Terrell 2020-09-11  1556              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1557          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1558          if ( dictMode == ZSTD_noDict
e0c1b49f5b674c Nick Terrell 2020-09-11  1559            && ((offset_1 > 0) & (MEM_read32(ip+1-offset_1) == MEM_read32(ip+1)))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1560              matchLength = ZSTD_count(ip+1+4, ip+1+4-offset_1, iend) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1561              if (depth==0) goto _storeSequence;
e0c1b49f5b674c Nick Terrell 2020-09-11  1562          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1563  
e0c1b49f5b674c Nick Terrell 2020-09-11  1564          /* first search (depth 0) */
e0c1b49f5b674c Nick Terrell 2020-09-11  1565          {   size_t offsetFound = 999999999;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1566              size_t const ml2 = ZSTD_searchMax(ms, ip, iend, &offsetFound, mls, rowLog, searchMethod, dictMode);
e0c1b49f5b674c Nick Terrell 2020-09-11  1567              if (ml2 > matchLength)
2aa14b1ab2c41a Nick Terrell 2022-10-17  1568                  matchLength = ml2, start = ip, offcode=offsetFound;
e0c1b49f5b674c Nick Terrell 2020-09-11  1569          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1570  
e0c1b49f5b674c Nick Terrell 2020-09-11  1571          if (matchLength < 4) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1572              ip += ((ip-anchor) >> kSearchStrength) + 1;   /* jump faster over incompressible sections */
e0c1b49f5b674c Nick Terrell 2020-09-11  1573              continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  1574          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1575  
e0c1b49f5b674c Nick Terrell 2020-09-11  1576          /* let's try to find a better solution */
e0c1b49f5b674c Nick Terrell 2020-09-11  1577          if (depth>=1)
e0c1b49f5b674c Nick Terrell 2020-09-11  1578          while (ip<ilimit) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1579              DEBUGLOG(7, "search depth 1");
e0c1b49f5b674c Nick Terrell 2020-09-11  1580              ip ++;
e0c1b49f5b674c Nick Terrell 2020-09-11  1581              if ( (dictMode == ZSTD_noDict)
2aa14b1ab2c41a Nick Terrell 2022-10-17  1582                && (offcode) && ((offset_1>0) & (MEM_read32(ip) == MEM_read32(ip - offset_1)))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1583                  size_t const mlRep = ZSTD_count(ip+4, ip+4-offset_1, iend) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1584                  int const gain2 = (int)(mlRep * 3);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1585                  int const gain1 = (int)(matchLength*3 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offcode)) + 1);
e0c1b49f5b674c Nick Terrell 2020-09-11  1586                  if ((mlRep >= 4) && (gain2 > gain1))
2aa14b1ab2c41a Nick Terrell 2022-10-17  1587                      matchLength = mlRep, offcode = STORE_REPCODE_1, start = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1588              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1589              if (isDxS) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1590                  const U32 repIndex = (U32)(ip - base) - offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  1591                  const BYTE* repMatch = repIndex < prefixLowestIndex ?
e0c1b49f5b674c Nick Terrell 2020-09-11  1592                                 dictBase + (repIndex - dictIndexDelta) :
e0c1b49f5b674c Nick Terrell 2020-09-11  1593                                 base + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  1594                  if (((U32)((prefixLowestIndex-1) - repIndex) >= 3 /* intentional underflow */)
e0c1b49f5b674c Nick Terrell 2020-09-11  1595                      && (MEM_read32(repMatch) == MEM_read32(ip)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1596                      const BYTE* repMatchEnd = repIndex < prefixLowestIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  1597                      size_t const mlRep = ZSTD_count_2segments(ip+4, repMatch+4, iend, repMatchEnd, prefixLowest) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1598                      int const gain2 = (int)(mlRep * 3);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1599                      int const gain1 = (int)(matchLength*3 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offcode)) + 1);
e0c1b49f5b674c Nick Terrell 2020-09-11  1600                      if ((mlRep >= 4) && (gain2 > gain1))
2aa14b1ab2c41a Nick Terrell 2022-10-17  1601                          matchLength = mlRep, offcode = STORE_REPCODE_1, start = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1602                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1603              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1604              {   size_t offset2=999999999;
2aa14b1ab2c41a Nick Terrell 2022-10-17 @1605                  size_t const ml2 = ZSTD_searchMax(ms, ip, iend, &offset2, mls, rowLog, searchMethod, dictMode);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1606                  int const gain2 = (int)(ml2*4 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offset2)));   /* raw approx */
2aa14b1ab2c41a Nick Terrell 2022-10-17  1607                  int const gain1 = (int)(matchLength*4 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offcode)) + 4);
e0c1b49f5b674c Nick Terrell 2020-09-11  1608                  if ((ml2 >= 4) && (gain2 > gain1)) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1609                      matchLength = ml2, offcode = offset2, start = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1610                      continue;   /* search a better one */
e0c1b49f5b674c Nick Terrell 2020-09-11  1611              }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1612  
e0c1b49f5b674c Nick Terrell 2020-09-11  1613              /* let's find an even better one */
e0c1b49f5b674c Nick Terrell 2020-09-11  1614              if ((depth==2) && (ip<ilimit)) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1615                  DEBUGLOG(7, "search depth 2");
e0c1b49f5b674c Nick Terrell 2020-09-11  1616                  ip ++;
e0c1b49f5b674c Nick Terrell 2020-09-11  1617                  if ( (dictMode == ZSTD_noDict)
2aa14b1ab2c41a Nick Terrell 2022-10-17  1618                    && (offcode) && ((offset_1>0) & (MEM_read32(ip) == MEM_read32(ip - offset_1)))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1619                      size_t const mlRep = ZSTD_count(ip+4, ip+4-offset_1, iend) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1620                      int const gain2 = (int)(mlRep * 4);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1621                      int const gain1 = (int)(matchLength*4 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offcode)) + 1);
e0c1b49f5b674c Nick Terrell 2020-09-11  1622                      if ((mlRep >= 4) && (gain2 > gain1))
2aa14b1ab2c41a Nick Terrell 2022-10-17  1623                          matchLength = mlRep, offcode = STORE_REPCODE_1, start = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1624                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1625                  if (isDxS) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1626                      const U32 repIndex = (U32)(ip - base) - offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  1627                      const BYTE* repMatch = repIndex < prefixLowestIndex ?
e0c1b49f5b674c Nick Terrell 2020-09-11  1628                                     dictBase + (repIndex - dictIndexDelta) :
e0c1b49f5b674c Nick Terrell 2020-09-11  1629                                     base + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  1630                      if (((U32)((prefixLowestIndex-1) - repIndex) >= 3 /* intentional underflow */)
e0c1b49f5b674c Nick Terrell 2020-09-11  1631                          && (MEM_read32(repMatch) == MEM_read32(ip)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1632                          const BYTE* repMatchEnd = repIndex < prefixLowestIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  1633                          size_t const mlRep = ZSTD_count_2segments(ip+4, repMatch+4, iend, repMatchEnd, prefixLowest) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1634                          int const gain2 = (int)(mlRep * 4);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1635                          int const gain1 = (int)(matchLength*4 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offcode)) + 1);
e0c1b49f5b674c Nick Terrell 2020-09-11  1636                          if ((mlRep >= 4) && (gain2 > gain1))
2aa14b1ab2c41a Nick Terrell 2022-10-17  1637                              matchLength = mlRep, offcode = STORE_REPCODE_1, start = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1638                      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1639                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1640                  {   size_t offset2=999999999;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1641                      size_t const ml2 = ZSTD_searchMax(ms, ip, iend, &offset2, mls, rowLog, searchMethod, dictMode);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1642                      int const gain2 = (int)(ml2*4 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offset2)));   /* raw approx */
2aa14b1ab2c41a Nick Terrell 2022-10-17  1643                      int const gain1 = (int)(matchLength*4 - ZSTD_highbit32((U32)STORED_TO_OFFBASE(offcode)) + 7);
e0c1b49f5b674c Nick Terrell 2020-09-11  1644                      if ((ml2 >= 4) && (gain2 > gain1)) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1645                          matchLength = ml2, offcode = offset2, start = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1646                          continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  1647              }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1648              break;  /* nothing found : store previous solution */
e0c1b49f5b674c Nick Terrell 2020-09-11  1649          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1650  
e0c1b49f5b674c Nick Terrell 2020-09-11  1651          /* NOTE:
2aa14b1ab2c41a Nick Terrell 2022-10-17  1652           * Pay attention that `start[-value]` can lead to strange undefined behavior
2aa14b1ab2c41a Nick Terrell 2022-10-17  1653           * notably if `value` is unsigned, resulting in a large positive `-value`.
e0c1b49f5b674c Nick Terrell 2020-09-11  1654           */
e0c1b49f5b674c Nick Terrell 2020-09-11  1655          /* catch up */
2aa14b1ab2c41a Nick Terrell 2022-10-17  1656          if (STORED_IS_OFFSET(offcode)) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1657              if (dictMode == ZSTD_noDict) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1658                  while ( ((start > anchor) & (start - STORED_OFFSET(offcode) > prefixLowest))
2aa14b1ab2c41a Nick Terrell 2022-10-17  1659                       && (start[-1] == (start-STORED_OFFSET(offcode))[-1]) )  /* only search for offset within prefix */
e0c1b49f5b674c Nick Terrell 2020-09-11  1660                      { start--; matchLength++; }
e0c1b49f5b674c Nick Terrell 2020-09-11  1661              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1662              if (isDxS) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  1663                  U32 const matchIndex = (U32)((size_t)(start-base) - STORED_OFFSET(offcode));
e0c1b49f5b674c Nick Terrell 2020-09-11  1664                  const BYTE* match = (matchIndex < prefixLowestIndex) ? dictBase + matchIndex - dictIndexDelta : base + matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  1665                  const BYTE* const mStart = (matchIndex < prefixLowestIndex) ? dictLowest : prefixLowest;
e0c1b49f5b674c Nick Terrell 2020-09-11  1666                  while ((start>anchor) && (match>mStart) && (start[-1] == match[-1])) { start--; match--; matchLength++; }  /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  1667              }
2aa14b1ab2c41a Nick Terrell 2022-10-17  1668              offset_2 = offset_1; offset_1 = (U32)STORED_OFFSET(offcode);
e0c1b49f5b674c Nick Terrell 2020-09-11  1669          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1670          /* store sequence */
e0c1b49f5b674c Nick Terrell 2020-09-11  1671  _storeSequence:
2aa14b1ab2c41a Nick Terrell 2022-10-17  1672          {   size_t const litLength = (size_t)(start - anchor);
2aa14b1ab2c41a Nick Terrell 2022-10-17  1673              ZSTD_storeSeq(seqStore, litLength, anchor, iend, (U32)offcode, matchLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  1674              anchor = ip = start + matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  1675          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1676  
e0c1b49f5b674c Nick Terrell 2020-09-11  1677          /* check immediate repcode */
e0c1b49f5b674c Nick Terrell 2020-09-11  1678          if (isDxS) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1679              while (ip <= ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1680                  U32 const current2 = (U32)(ip-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  1681                  U32 const repIndex = current2 - offset_2;
e0c1b49f5b674c Nick Terrell 2020-09-11  1682                  const BYTE* repMatch = repIndex < prefixLowestIndex ?
e0c1b49f5b674c Nick Terrell 2020-09-11  1683                          dictBase - dictIndexDelta + repIndex :
e0c1b49f5b674c Nick Terrell 2020-09-11  1684                          base + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  1685                  if ( ((U32)((prefixLowestIndex-1) - (U32)repIndex) >= 3 /* intentional overflow */)
e0c1b49f5b674c Nick Terrell 2020-09-11  1686                     && (MEM_read32(repMatch) == MEM_read32(ip)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1687                      const BYTE* const repEnd2 = repIndex < prefixLowestIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  1688                      matchLength = ZSTD_count_2segments(ip+4, repMatch+4, iend, repEnd2, prefixLowest) + 4;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1689                      offcode = offset_2; offset_2 = offset_1; offset_1 = (U32)offcode;   /* swap offset_2 <=> offset_1 */
2aa14b1ab2c41a Nick Terrell 2022-10-17  1690                      ZSTD_storeSeq(seqStore, 0, anchor, iend, STORE_REPCODE_1, matchLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  1691                      ip += matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  1692                      anchor = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1693                      continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  1694                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1695                  break;
e0c1b49f5b674c Nick Terrell 2020-09-11  1696              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1697          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1698  
e0c1b49f5b674c Nick Terrell 2020-09-11  1699          if (dictMode == ZSTD_noDict) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1700              while ( ((ip <= ilimit) & (offset_2>0))
e0c1b49f5b674c Nick Terrell 2020-09-11  1701                   && (MEM_read32(ip) == MEM_read32(ip - offset_2)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1702                  /* store sequence */
e0c1b49f5b674c Nick Terrell 2020-09-11  1703                  matchLength = ZSTD_count(ip+4, ip+4-offset_2, iend) + 4;
2aa14b1ab2c41a Nick Terrell 2022-10-17  1704                  offcode = offset_2; offset_2 = offset_1; offset_1 = (U32)offcode; /* swap repcodes */
2aa14b1ab2c41a Nick Terrell 2022-10-17  1705                  ZSTD_storeSeq(seqStore, 0, anchor, iend, STORE_REPCODE_1, matchLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  1706                  ip += matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  1707                  anchor = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  1708                  continue;   /* faster when present ... (?) */
e0c1b49f5b674c Nick Terrell 2020-09-11  1709      }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1710  
e0c1b49f5b674c Nick Terrell 2020-09-11  1711      /* Save reps for next block */
e0c1b49f5b674c Nick Terrell 2020-09-11  1712      rep[0] = offset_1 ? offset_1 : savedOffset;
e0c1b49f5b674c Nick Terrell 2020-09-11  1713      rep[1] = offset_2 ? offset_2 : savedOffset;
e0c1b49f5b674c Nick Terrell 2020-09-11  1714  
e0c1b49f5b674c Nick Terrell 2020-09-11  1715      /* Return the last literals size */
e0c1b49f5b674c Nick Terrell 2020-09-11  1716      return (size_t)(iend - anchor);
e0c1b49f5b674c Nick Terrell 2020-09-11  1717  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1718  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
