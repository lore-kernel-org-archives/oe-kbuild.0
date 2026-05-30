Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C53976B8
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780135594; cv=none; b=gxdr4UcgEXOC6Xp12D4ooCYEmbBHyetWiC4Jwxn9aY2a0wVsdStoT/a+q/jmNDRZPdNnczIwcKhOSGlNKKqK4Pmfbj0b5pUGpDQdCfMqP4CFAz/wI5yrGouM8jM0/dvFKP453j8bH0dlQrXHl7qbqJb+L+vU5WUG9Gbelb6XTzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780135594; c=relaxed/simple;
	bh=6KgFRtgfh9pfqWltsoQZYxykXfR42nepohLlZy+SO8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsKGS7dZc3EnCV+Jc6ZB7ZoRawTA6Yl+J5TLm06QnEuOGEfJMDo8oqB5ssannLKrIbeg9tagl8GHpJQxfJMRc94ST5ABAbhUkDepm2TXhQWL+RlvY1qJpStVc7s/k/dg0PXHUXPSUyOyf7aVMsPbp5Ir/5S7tU7eFuZuDRAftGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDKXFHQa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDKXFHQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780135594; x=1811671594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KgFRtgfh9pfqWltsoQZYxykXfR42nepohLlZy+SO8E=;
  b=eDKXFHQaN73xpfmJmkzbeKL+rCiDV3xDsnCikGer+idhIuBKi5TWcTXG
   1lhioV0O7Y0S1WawVNW90bWgu3oYrAJTozzvzqqo7YsLn/jBLs2GF8zPm
   SmxNGwEcHPIBEYjTSVFlEcSq2/J/JgK6kCSyMjqLyBLlXeZbR204rzAik
   qV4w1Skf+KQjpnogTARiUif1XwBYyxqm25u01eVlT4c4yMNVLnjyoTRbk
   ep+sWv+Fh96Xcs65k8iilZksWQW7x/EMSy2fdNHvQv83AH7BZTUDCprZa
   XGxN4AhiRSkjBLTeCkdmVi21yP1PgirJxV4oZ6edX9zG0bMt5RnsCMU/1
   A==;
X-CSE-ConnectionGUID: NxAO5uSAR4igoFPq38On5A==
X-CSE-MsgGUID: UkI6OQoRQ8+CK41xEzyfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80869529"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80869529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 03:06:33 -0700
X-CSE-ConnectionGUID: AkUy4R58SzOCQkSX0gxIjQ==
X-CSE-MsgGUID: aeXI0ikLSAKN5pYoIgwaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="242031131"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 May 2026 03:06:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTGaK-000000008JK-37hs;
	Sat, 30 May 2026 10:06:28 +0000
Date: Sat, 30 May 2026 18:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] zstd: reducing inlining for KASAN_STACK
Message-ID: <202605301847.K2ZpOQkX-lkp@intel.com>
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
In-Reply-To: <20260526145050.3004668-1-arnd@kernel.org>
References: <20260526145050.3004668-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>
TO: Nick Terrell <terrelln@fb.com>
TO: David Sterba <dsterba@suse.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: linux-kernel@vger.kernel.org

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v7.1-rc5 next-20260529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/zstd-reducing-inlining-for-KASAN_STACK/20260526-231543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260526145050.3004668-1-arnd%40kernel.org
patch subject: [PATCH] zstd: reducing inlining for KASAN_STACK
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301847.K2ZpOQkX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605301847.K2ZpOQkX-lkp@intel.com/

New smatch warnings:
lib/zstd/decompress/huf_decompress.c:1470 HUF_decompress4X2_usingDTable_internal_body() warn: check likely/unlikely parentheses

Old smatch warnings:
lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &

vim +1470 lib/zstd/decompress/huf_decompress.c

65d1f5507ed2c7 Nick Terrell      2025-03-08  1375  
65d1f5507ed2c7 Nick Terrell      2025-03-08  1376  /* HUF_decompress4X2_usingDTable_internal_body():
65d1f5507ed2c7 Nick Terrell      2025-03-08  1377   * Conditions:
65d1f5507ed2c7 Nick Terrell      2025-03-08  1378   * @dstSize >= 6
65d1f5507ed2c7 Nick Terrell      2025-03-08  1379   */
e0c1b49f5b674c Nick Terrell      2020-09-11  1380  FORCE_INLINE_TEMPLATE size_t
e0c1b49f5b674c Nick Terrell      2020-09-11  1381  HUF_decompress4X2_usingDTable_internal_body(
e0c1b49f5b674c Nick Terrell      2020-09-11  1382            void* dst,  size_t dstSize,
e0c1b49f5b674c Nick Terrell      2020-09-11  1383      const void* cSrc, size_t cSrcSize,
e0c1b49f5b674c Nick Terrell      2020-09-11  1384      const HUF_DTable* DTable)
e0c1b49f5b674c Nick Terrell      2020-09-11  1385  {
e0c1b49f5b674c Nick Terrell      2020-09-11  1386      if (cSrcSize < 10) return ERROR(corruption_detected);   /* strict minimum : jump table + 1 byte per stream */
65d1f5507ed2c7 Nick Terrell      2025-03-08  1387      if (dstSize < 6) return ERROR(corruption_detected);         /* stream 4-split doesn't work */
e0c1b49f5b674c Nick Terrell      2020-09-11  1388  
e0c1b49f5b674c Nick Terrell      2020-09-11  1389      {   const BYTE* const istart = (const BYTE*) cSrc;
e0c1b49f5b674c Nick Terrell      2020-09-11  1390          BYTE* const ostart = (BYTE*) dst;
e0c1b49f5b674c Nick Terrell      2020-09-11  1391          BYTE* const oend = ostart + dstSize;
e0c1b49f5b674c Nick Terrell      2020-09-11  1392          BYTE* const olimit = oend - (sizeof(size_t)-1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1393          const void* const dtPtr = DTable+1;
e0c1b49f5b674c Nick Terrell      2020-09-11  1394          const HUF_DEltX2* const dt = (const HUF_DEltX2*)dtPtr;
e0c1b49f5b674c Nick Terrell      2020-09-11  1395  
e0c1b49f5b674c Nick Terrell      2020-09-11  1396          /* Init */
e0c1b49f5b674c Nick Terrell      2020-09-11  1397          BIT_DStream_t bitD1;
e0c1b49f5b674c Nick Terrell      2020-09-11  1398          BIT_DStream_t bitD2;
e0c1b49f5b674c Nick Terrell      2020-09-11  1399          BIT_DStream_t bitD3;
e0c1b49f5b674c Nick Terrell      2020-09-11  1400          BIT_DStream_t bitD4;
e0c1b49f5b674c Nick Terrell      2020-09-11  1401          size_t const length1 = MEM_readLE16(istart);
e0c1b49f5b674c Nick Terrell      2020-09-11  1402          size_t const length2 = MEM_readLE16(istart+2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1403          size_t const length3 = MEM_readLE16(istart+4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1404          size_t const length4 = cSrcSize - (length1 + length2 + length3 + 6);
e0c1b49f5b674c Nick Terrell      2020-09-11  1405          const BYTE* const istart1 = istart + 6;  /* jumpTable */
e0c1b49f5b674c Nick Terrell      2020-09-11  1406          const BYTE* const istart2 = istart1 + length1;
e0c1b49f5b674c Nick Terrell      2020-09-11  1407          const BYTE* const istart3 = istart2 + length2;
e0c1b49f5b674c Nick Terrell      2020-09-11  1408          const BYTE* const istart4 = istart3 + length3;
e0c1b49f5b674c Nick Terrell      2020-09-11  1409          size_t const segmentSize = (dstSize+3) / 4;
e0c1b49f5b674c Nick Terrell      2020-09-11  1410          BYTE* const opStart2 = ostart + segmentSize;
e0c1b49f5b674c Nick Terrell      2020-09-11  1411          BYTE* const opStart3 = opStart2 + segmentSize;
e0c1b49f5b674c Nick Terrell      2020-09-11  1412          BYTE* const opStart4 = opStart3 + segmentSize;
e0c1b49f5b674c Nick Terrell      2020-09-11  1413          BYTE* op1 = ostart;
e0c1b49f5b674c Nick Terrell      2020-09-11  1414          BYTE* op2 = opStart2;
e0c1b49f5b674c Nick Terrell      2020-09-11  1415          BYTE* op3 = opStart3;
e0c1b49f5b674c Nick Terrell      2020-09-11  1416          BYTE* op4 = opStart4;
e0c1b49f5b674c Nick Terrell      2020-09-11  1417          U32 endSignal = 1;
e0c1b49f5b674c Nick Terrell      2020-09-11  1418          DTableDesc const dtd = HUF_getDTableDesc(DTable);
e0c1b49f5b674c Nick Terrell      2020-09-11  1419          U32 const dtLog = dtd.tableLog;
e0c1b49f5b674c Nick Terrell      2020-09-11  1420  
e0c1b49f5b674c Nick Terrell      2020-09-11  1421          if (length4 > cSrcSize) return ERROR(corruption_detected);  /* overflow */
2aa14b1ab2c41a Nick Terrell      2022-10-17  1422          if (opStart4 > oend) return ERROR(corruption_detected);     /* overflow */
65d1f5507ed2c7 Nick Terrell      2025-03-08  1423          assert(dstSize >= 6 /* validated above */);
e0c1b49f5b674c Nick Terrell      2020-09-11  1424          CHECK_F( BIT_initDStream(&bitD1, istart1, length1) );
e0c1b49f5b674c Nick Terrell      2020-09-11  1425          CHECK_F( BIT_initDStream(&bitD2, istart2, length2) );
e0c1b49f5b674c Nick Terrell      2020-09-11  1426          CHECK_F( BIT_initDStream(&bitD3, istart3, length3) );
e0c1b49f5b674c Nick Terrell      2020-09-11  1427          CHECK_F( BIT_initDStream(&bitD4, istart4, length4) );
e0c1b49f5b674c Nick Terrell      2020-09-11  1428  
e0c1b49f5b674c Nick Terrell      2020-09-11  1429          /* 16-32 symbols per loop (4-8 symbols per stream) */
2aa14b1ab2c41a Nick Terrell      2022-10-17  1430          if ((size_t)(oend - op4) >= sizeof(size_t)) {
e0c1b49f5b674c Nick Terrell      2020-09-11  1431              for ( ; (endSignal) & (op4 < olimit); ) {
e0c1b49f5b674c Nick Terrell      2020-09-11  1432  #if defined(__clang__) && (defined(__x86_64__) || defined(__i386__))
e0c1b49f5b674c Nick Terrell      2020-09-11  1433                  HUF_DECODE_SYMBOLX2_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1434                  HUF_DECODE_SYMBOLX2_1(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1435                  HUF_DECODE_SYMBOLX2_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1436                  HUF_DECODE_SYMBOLX2_0(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1437                  HUF_DECODE_SYMBOLX2_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1438                  HUF_DECODE_SYMBOLX2_1(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1439                  HUF_DECODE_SYMBOLX2_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1440                  HUF_DECODE_SYMBOLX2_0(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1441                  endSignal &= BIT_reloadDStreamFast(&bitD1) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell      2020-09-11  1442                  endSignal &= BIT_reloadDStreamFast(&bitD2) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell      2020-09-11  1443                  HUF_DECODE_SYMBOLX2_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1444                  HUF_DECODE_SYMBOLX2_1(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1445                  HUF_DECODE_SYMBOLX2_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1446                  HUF_DECODE_SYMBOLX2_0(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1447                  HUF_DECODE_SYMBOLX2_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1448                  HUF_DECODE_SYMBOLX2_1(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1449                  HUF_DECODE_SYMBOLX2_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1450                  HUF_DECODE_SYMBOLX2_0(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1451                  endSignal &= BIT_reloadDStreamFast(&bitD3) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell      2020-09-11  1452                  endSignal &= BIT_reloadDStreamFast(&bitD4) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell      2020-09-11  1453  #else
e0c1b49f5b674c Nick Terrell      2020-09-11  1454                  HUF_DECODE_SYMBOLX2_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1455                  HUF_DECODE_SYMBOLX2_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1456                  HUF_DECODE_SYMBOLX2_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1457                  HUF_DECODE_SYMBOLX2_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1458                  HUF_DECODE_SYMBOLX2_1(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1459                  HUF_DECODE_SYMBOLX2_1(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1460                  HUF_DECODE_SYMBOLX2_1(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1461                  HUF_DECODE_SYMBOLX2_1(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1462                  HUF_DECODE_SYMBOLX2_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1463                  HUF_DECODE_SYMBOLX2_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1464                  HUF_DECODE_SYMBOLX2_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1465                  HUF_DECODE_SYMBOLX2_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1466                  HUF_DECODE_SYMBOLX2_0(op1, &bitD1);
e0c1b49f5b674c Nick Terrell      2020-09-11  1467                  HUF_DECODE_SYMBOLX2_0(op2, &bitD2);
e0c1b49f5b674c Nick Terrell      2020-09-11  1468                  HUF_DECODE_SYMBOLX2_0(op3, &bitD3);
e0c1b49f5b674c Nick Terrell      2020-09-11  1469                  HUF_DECODE_SYMBOLX2_0(op4, &bitD4);
0a8ea235837cc3 Nathan Chancellor 2021-10-21 @1470                  endSignal = (U32)LIKELY((U32)
e0c1b49f5b674c Nick Terrell      2020-09-11  1471                              (BIT_reloadDStreamFast(&bitD1) == BIT_DStream_unfinished)
e0c1b49f5b674c Nick Terrell      2020-09-11  1472                          & (BIT_reloadDStreamFast(&bitD2) == BIT_DStream_unfinished)
e0c1b49f5b674c Nick Terrell      2020-09-11  1473                          & (BIT_reloadDStreamFast(&bitD3) == BIT_DStream_unfinished)
e0c1b49f5b674c Nick Terrell      2020-09-11  1474                          & (BIT_reloadDStreamFast(&bitD4) == BIT_DStream_unfinished));
e0c1b49f5b674c Nick Terrell      2020-09-11  1475  #endif
e0c1b49f5b674c Nick Terrell      2020-09-11  1476              }
2aa14b1ab2c41a Nick Terrell      2022-10-17  1477          }
e0c1b49f5b674c Nick Terrell      2020-09-11  1478  
e0c1b49f5b674c Nick Terrell      2020-09-11  1479          /* check corruption */
e0c1b49f5b674c Nick Terrell      2020-09-11  1480          if (op1 > opStart2) return ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell      2020-09-11  1481          if (op2 > opStart3) return ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell      2020-09-11  1482          if (op3 > opStart4) return ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell      2020-09-11  1483          /* note : op4 already verified within main loop */
e0c1b49f5b674c Nick Terrell      2020-09-11  1484  
e0c1b49f5b674c Nick Terrell      2020-09-11  1485          /* finish bitStreams one by one */
e0c1b49f5b674c Nick Terrell      2020-09-11  1486          HUF_decodeStreamX2(op1, &bitD1, opStart2, dt, dtLog);
e0c1b49f5b674c Nick Terrell      2020-09-11  1487          HUF_decodeStreamX2(op2, &bitD2, opStart3, dt, dtLog);
e0c1b49f5b674c Nick Terrell      2020-09-11  1488          HUF_decodeStreamX2(op3, &bitD3, opStart4, dt, dtLog);
e0c1b49f5b674c Nick Terrell      2020-09-11  1489          HUF_decodeStreamX2(op4, &bitD4, oend,     dt, dtLog);
e0c1b49f5b674c Nick Terrell      2020-09-11  1490  
e0c1b49f5b674c Nick Terrell      2020-09-11  1491          /* check */
e0c1b49f5b674c Nick Terrell      2020-09-11  1492          { U32 const endCheck = BIT_endOfDStream(&bitD1) & BIT_endOfDStream(&bitD2) & BIT_endOfDStream(&bitD3) & BIT_endOfDStream(&bitD4);
e0c1b49f5b674c Nick Terrell      2020-09-11  1493            if (!endCheck) return ERROR(corruption_detected); }
e0c1b49f5b674c Nick Terrell      2020-09-11  1494  
e0c1b49f5b674c Nick Terrell      2020-09-11  1495          /* decoded size */
e0c1b49f5b674c Nick Terrell      2020-09-11  1496          return dstSize;
e0c1b49f5b674c Nick Terrell      2020-09-11  1497      }
e0c1b49f5b674c Nick Terrell      2020-09-11  1498  }
e0c1b49f5b674c Nick Terrell      2020-09-11  1499  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
