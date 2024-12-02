Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091371E521
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733142069; cv=none; b=JbneBaWV5C71jhLtEkA0yalXITXHkoZd+4Q+2EDZ74W/vwETrjzdR+IUKRpsMgW/jxKcpuUpCc6fRBScdVHuwGwUJnYanMGz6/pkdCInIyBCvtWfTUCSLiKU+vgIOg1tat58LRXirjc9UYFBvFsZyf7sJfqUs/MzfLY4gGVHZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733142069; c=relaxed/simple;
	bh=txsPfg4uX7hH6D9dJZu//PAWXNnilcPb2XonD/1QRRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PzOz47+6oKfOOGToSLmJwTlt0l6oS/offiewZqwk7MlePhXoIUMt7068Q7ahiNgDPaOdILQldTDTI8yKFsAfx5f1cTzETMqDzlWyAH8HAtJUQGCLxigKnutYZXjse8i5dLnYpNkfQqLeXc1IfM7KjTovj5XD79myxE4whkNLvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIlrdSaF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIlrdSaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733142067; x=1764678067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txsPfg4uX7hH6D9dJZu//PAWXNnilcPb2XonD/1QRRU=;
  b=dIlrdSaFF2XZ4zkwUSXnpf2vhT42Wb/3cPa8vy2WQsNmfdUxDSPFi34o
   nppyJkaWYFe04DHXv6Ja/7OLqFIVu64MAwXXFSYqM7zIxTZ7CFeXogOSX
   7E2hGughI1eNnmpUKYSoczKuxsnx368khoex3fWzw2rfJTB5uVqkQkXON
   v9ca+VXh7TjTj3KtehERL6Qnb9CPgQEtJZdCb5TpI16spG9JKhN1+oMKS
   jcVA80ZjGu4RWpj6ZIP4fECiQUbuYlvWsqz87TNJL9i1qugAyz+3dpMfn
   2W2lf32gcZQ3uwzTU+oZTjEG/Kupj0DsaTDjdO2q5UPzOw0biv4UDcC01
   g==;
X-CSE-ConnectionGUID: Zd+eODkqS6Gr5h5Nbf/1vA==
X-CSE-MsgGUID: 7ahi2TwARSCHjGZfK6wPBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33227544"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33227544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 04:20:56 -0800
X-CSE-ConnectionGUID: nFJ4/HRcT3O0ApJpSx/gBg==
X-CSE-MsgGUID: Bp3afNzeTzCXNOBMelhnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93565466"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2024 04:20:55 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI5Q4-0002Oh-25;
	Mon, 02 Dec 2024 12:20:52 +0000
Date: Mon, 2 Dec 2024 20:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:397
 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of
 &
Message-ID: <202412022032.fq9r9DGX-lkp@intel.com>
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
TO: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: edd4a8667355607345b76d5652adc0f300a28970 s390/boot: get rid of startup archive
date:   2 years, 7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 2 years, 7 months ago
config: s390-randconfig-r073-20241112 (https://download.01.org/0day-ci/archive/20241202/202412022032.fq9r9DGX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412022032.fq9r9DGX-lkp@intel.com/

smatch warnings:
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:397 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:397 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:850 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:850 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &

vim +397 arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c

e0c1b49f5b674c Nick Terrell 2020-09-11  348  
e0c1b49f5b674c Nick Terrell 2020-09-11  349  FORCE_INLINE_TEMPLATE size_t
e0c1b49f5b674c Nick Terrell 2020-09-11  350  HUF_decompress4X1_usingDTable_internal_body(
e0c1b49f5b674c Nick Terrell 2020-09-11  351            void* dst,  size_t dstSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  352      const void* cSrc, size_t cSrcSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  353      const HUF_DTable* DTable)
e0c1b49f5b674c Nick Terrell 2020-09-11  354  {
e0c1b49f5b674c Nick Terrell 2020-09-11  355      /* Check */
e0c1b49f5b674c Nick Terrell 2020-09-11  356      if (cSrcSize < 10) return ERROR(corruption_detected);  /* strict minimum : jump table + 1 byte per stream */
e0c1b49f5b674c Nick Terrell 2020-09-11  357  
e0c1b49f5b674c Nick Terrell 2020-09-11  358      {   const BYTE* const istart = (const BYTE*) cSrc;
e0c1b49f5b674c Nick Terrell 2020-09-11  359          BYTE* const ostart = (BYTE*) dst;
e0c1b49f5b674c Nick Terrell 2020-09-11  360          BYTE* const oend = ostart + dstSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  361          BYTE* const olimit = oend - 3;
e0c1b49f5b674c Nick Terrell 2020-09-11  362          const void* const dtPtr = DTable + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  363          const HUF_DEltX1* const dt = (const HUF_DEltX1*)dtPtr;
e0c1b49f5b674c Nick Terrell 2020-09-11  364  
e0c1b49f5b674c Nick Terrell 2020-09-11  365          /* Init */
e0c1b49f5b674c Nick Terrell 2020-09-11  366          BIT_DStream_t bitD1;
e0c1b49f5b674c Nick Terrell 2020-09-11  367          BIT_DStream_t bitD2;
e0c1b49f5b674c Nick Terrell 2020-09-11  368          BIT_DStream_t bitD3;
e0c1b49f5b674c Nick Terrell 2020-09-11  369          BIT_DStream_t bitD4;
e0c1b49f5b674c Nick Terrell 2020-09-11  370          size_t const length1 = MEM_readLE16(istart);
e0c1b49f5b674c Nick Terrell 2020-09-11  371          size_t const length2 = MEM_readLE16(istart+2);
e0c1b49f5b674c Nick Terrell 2020-09-11  372          size_t const length3 = MEM_readLE16(istart+4);
e0c1b49f5b674c Nick Terrell 2020-09-11  373          size_t const length4 = cSrcSize - (length1 + length2 + length3 + 6);
e0c1b49f5b674c Nick Terrell 2020-09-11  374          const BYTE* const istart1 = istart + 6;  /* jumpTable */
e0c1b49f5b674c Nick Terrell 2020-09-11  375          const BYTE* const istart2 = istart1 + length1;
e0c1b49f5b674c Nick Terrell 2020-09-11  376          const BYTE* const istart3 = istart2 + length2;
e0c1b49f5b674c Nick Terrell 2020-09-11  377          const BYTE* const istart4 = istart3 + length3;
e0c1b49f5b674c Nick Terrell 2020-09-11  378          const size_t segmentSize = (dstSize+3) / 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  379          BYTE* const opStart2 = ostart + segmentSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  380          BYTE* const opStart3 = opStart2 + segmentSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  381          BYTE* const opStart4 = opStart3 + segmentSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  382          BYTE* op1 = ostart;
e0c1b49f5b674c Nick Terrell 2020-09-11  383          BYTE* op2 = opStart2;
e0c1b49f5b674c Nick Terrell 2020-09-11  384          BYTE* op3 = opStart3;
e0c1b49f5b674c Nick Terrell 2020-09-11  385          BYTE* op4 = opStart4;
e0c1b49f5b674c Nick Terrell 2020-09-11  386          DTableDesc const dtd = HUF_getDTableDesc(DTable);
e0c1b49f5b674c Nick Terrell 2020-09-11  387          U32 const dtLog = dtd.tableLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  388          U32 endSignal = 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  389  
e0c1b49f5b674c Nick Terrell 2020-09-11  390          if (length4 > cSrcSize) return ERROR(corruption_detected);   /* overflow */
e0c1b49f5b674c Nick Terrell 2020-09-11  391          CHECK_F( BIT_initDStream(&bitD1, istart1, length1) );
e0c1b49f5b674c Nick Terrell 2020-09-11  392          CHECK_F( BIT_initDStream(&bitD2, istart2, length2) );
e0c1b49f5b674c Nick Terrell 2020-09-11  393          CHECK_F( BIT_initDStream(&bitD3, istart3, length3) );
e0c1b49f5b674c Nick Terrell 2020-09-11  394          CHECK_F( BIT_initDStream(&bitD4, istart4, length4) );
e0c1b49f5b674c Nick Terrell 2020-09-11  395  
e0c1b49f5b674c Nick Terrell 2020-09-11  396          /* up to 16 symbols per loop (4 symbols per stream) in 64-bit mode */
e0c1b49f5b674c Nick Terrell 2020-09-11 @397          for ( ; (endSignal) & (op4 < olimit) ; ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  398              HUF_DECODE_SYMBOLX1_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  399              HUF_DECODE_SYMBOLX1_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  400              HUF_DECODE_SYMBOLX1_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  401              HUF_DECODE_SYMBOLX1_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  402              HUF_DECODE_SYMBOLX1_1(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  403              HUF_DECODE_SYMBOLX1_1(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  404              HUF_DECODE_SYMBOLX1_1(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  405              HUF_DECODE_SYMBOLX1_1(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  406              HUF_DECODE_SYMBOLX1_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  407              HUF_DECODE_SYMBOLX1_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  408              HUF_DECODE_SYMBOLX1_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  409              HUF_DECODE_SYMBOLX1_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  410              HUF_DECODE_SYMBOLX1_0(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  411              HUF_DECODE_SYMBOLX1_0(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  412              HUF_DECODE_SYMBOLX1_0(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  413              HUF_DECODE_SYMBOLX1_0(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  414              endSignal &= BIT_reloadDStreamFast(&bitD1) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  415              endSignal &= BIT_reloadDStreamFast(&bitD2) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  416              endSignal &= BIT_reloadDStreamFast(&bitD3) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  417              endSignal &= BIT_reloadDStreamFast(&bitD4) == BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  418          }
e0c1b49f5b674c Nick Terrell 2020-09-11  419  
e0c1b49f5b674c Nick Terrell 2020-09-11  420          /* check corruption */
e0c1b49f5b674c Nick Terrell 2020-09-11  421          /* note : should not be necessary : op# advance in lock step, and we control op4.
e0c1b49f5b674c Nick Terrell 2020-09-11  422           *        but curiously, binary generated by gcc 7.2 & 7.3 with -mbmi2 runs faster when >=1 test is present */
e0c1b49f5b674c Nick Terrell 2020-09-11  423          if (op1 > opStart2) return ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell 2020-09-11  424          if (op2 > opStart3) return ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell 2020-09-11  425          if (op3 > opStart4) return ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell 2020-09-11  426          /* note : op4 supposed already verified within main loop */
e0c1b49f5b674c Nick Terrell 2020-09-11  427  
e0c1b49f5b674c Nick Terrell 2020-09-11  428          /* finish bitStreams one by one */
e0c1b49f5b674c Nick Terrell 2020-09-11  429          HUF_decodeStreamX1(op1, &bitD1, opStart2, dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  430          HUF_decodeStreamX1(op2, &bitD2, opStart3, dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  431          HUF_decodeStreamX1(op3, &bitD3, opStart4, dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  432          HUF_decodeStreamX1(op4, &bitD4, oend,     dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  433  
e0c1b49f5b674c Nick Terrell 2020-09-11  434          /* check */
e0c1b49f5b674c Nick Terrell 2020-09-11  435          { U32 const endCheck = BIT_endOfDStream(&bitD1) & BIT_endOfDStream(&bitD2) & BIT_endOfDStream(&bitD3) & BIT_endOfDStream(&bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  436            if (!endCheck) return ERROR(corruption_detected); }
e0c1b49f5b674c Nick Terrell 2020-09-11  437  
e0c1b49f5b674c Nick Terrell 2020-09-11  438          /* decoded size */
e0c1b49f5b674c Nick Terrell 2020-09-11  439          return dstSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  440      }
e0c1b49f5b674c Nick Terrell 2020-09-11  441  }
e0c1b49f5b674c Nick Terrell 2020-09-11  442  

:::::: The code at line 397 was first introduced by commit
:::::: e0c1b49f5b674cca7b10549c53b3791d0bbc90a8 lib: zstd: Upgrade to latest upstream zstd version 1.4.10

:::::: TO: Nick Terrell <terrelln@fb.com>
:::::: CC: Nick Terrell <terrelln@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
