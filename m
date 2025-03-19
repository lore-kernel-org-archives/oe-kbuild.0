Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822421C17B
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Mar 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742423010; cv=none; b=IV7C0k/np9NyfWswm15Dhi+v4tNAe1A5vgbAHkv9Zgc0WR9oGJ0sXoAyuZnwrvAfQd7xnBp1xrhmjyDr4r1EaQCFamqvbCt52FbntMQbgu+IC1erUfBb3TlGQkYNEPpOheQ0QB/hYGoJHmpBMpx9FfASMGwLYBnEqZh7Lzr9MTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742423010; c=relaxed/simple;
	bh=chJDT1j4V1XaRzUr9oAx5s8+LawpJtDP9D0oMrQWMfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcWO5UB58Z1XNgz6KJ5NQ3+NokDUOzrNDDzeY1qI6edfCQXs/Yy1nywAGDL6D137hLFYJzVcY8Uwq+Xw9Y0fgKpan9oX79QKoHSRgqG14Yb/KqhnDm9YuzmM2HPvz5Tqv17l4PA45uLu77uEFEv3BV5QlPwMXM0ZPFIegUFCrag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7mg7G4p; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7mg7G4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742423008; x=1773959008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chJDT1j4V1XaRzUr9oAx5s8+LawpJtDP9D0oMrQWMfA=;
  b=K7mg7G4pqrr5itiOmQfNCG0S8dSNGz9SQ4GuCuOFYfWxx5H2IkE9M1ZH
   zN2NHdXAU6ygIsoxpukF/9Ih1L1TO+WMm4y76RtvZo7tpTXWG1dtizWpw
   GaGnNCSVYklSKfUUPfj9H808VVBwn7V6gZF9QOfAy6msvgD+GfIBxTMD9
   wowLLFaKGHWGkrotWYhIvcD8bxdz3N7zyi+XobQo57pS9KvvvCxB5bmOS
   Ecz2YhHzB1deHPPYbukHUsTxj+DGqU34NhxaaJwGD9K2h6GvZtPt2/53R
   lB3TTqDVYh23EssetMIGiZdVwb6FWs5mvtZnVYoIe39LZe9Qr5SEpyz1B
   w==;
X-CSE-ConnectionGUID: BIAGDexFQ7Co+DzYzQkq1Q==
X-CSE-MsgGUID: SsdMbKd3SjOEGfx1zQ1uVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47290757"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="47290757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 15:23:28 -0700
X-CSE-ConnectionGUID: +uT5oMphRguKMonuIz6eRQ==
X-CSE-MsgGUID: +XHQvWT/QzCiVFV8o5PoqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122821279"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2025 15:23:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv1ok-000FiI-2y;
	Wed, 19 Mar 2025 22:23:20 +0000
Date: Thu, 20 Mar 2025 06:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9809/12447]
 lib/zstd/compress/zstd_double_fast.c:664
 ZSTD_compressBlock_doubleFast_extDict_generic() warn: maybe use && instead
 of &
Message-ID: <202503200605.koPav9ij-lkp@intel.com>
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
TO: Nick Terrell <terrelln@meta.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 [9809/12447] zstd: Import upstream v1.5.7
:::::: branch date: 12 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250319 (https://download.01.org/0day-ci/archive/20250320/202503200605.koPav9ij-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503200605.koPav9ij-lkp@intel.com/

New smatch warnings:
lib/zstd/compress/zstd_double_fast.c:664 ZSTD_compressBlock_doubleFast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_opt.c:668 ZSTD_insertBtAndGetAllMatches() warn: maybe use && instead of &
lib/zstd/compress/zstd_lazy.c:1991 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &

Old smatch warnings:
lib/zstd/compress/zstd_double_fast.c:732 ZSTD_compressBlock_doubleFast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_opt.c:674 ZSTD_insertBtAndGetAllMatches() warn: maybe use && instead of &
lib/zstd/compress/zstd_opt.c:1382 ZSTD_compressBlock_opt_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_opt.c:1392 ZSTD_compressBlock_opt_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_lazy.c:1629 ZSTD_compressBlock_lazy_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1657 ZSTD_compressBlock_lazy_generic() warn: Function too hairy.  No more merges.
lib/zstd/compress/zstd_lazy.c:1990 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2021 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2031 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2032 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_lazy.c:2063 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2064 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_lazy.c:2117 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2118 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &

vim +664 lib/zstd/compress/zstd_double_fast.c

e0c1b49f5b674c Nick Terrell 2020-09-11  607  
e0c1b49f5b674c Nick Terrell 2020-09-11  608  
65d1f5507ed2c7 Nick Terrell 2025-03-08  609  static
65d1f5507ed2c7 Nick Terrell 2025-03-08  610  ZSTD_ALLOW_POINTER_OVERFLOW_ATTR
65d1f5507ed2c7 Nick Terrell 2025-03-08  611  size_t ZSTD_compressBlock_doubleFast_extDict_generic(
65d1f5507ed2c7 Nick Terrell 2025-03-08  612          ZSTD_MatchState_t* ms, SeqStore_t* seqStore, U32 rep[ZSTD_REP_NUM],
e0c1b49f5b674c Nick Terrell 2020-09-11  613          void const* src, size_t srcSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  614          U32 const mls /* template */)
e0c1b49f5b674c Nick Terrell 2020-09-11  615  {
e0c1b49f5b674c Nick Terrell 2020-09-11  616      ZSTD_compressionParameters const* cParams = &ms->cParams;
e0c1b49f5b674c Nick Terrell 2020-09-11  617      U32* const hashLong = ms->hashTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  618      U32  const hBitsL = cParams->hashLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  619      U32* const hashSmall = ms->chainTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  620      U32  const hBitsS = cParams->chainLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  621      const BYTE* const istart = (const BYTE*)src;
e0c1b49f5b674c Nick Terrell 2020-09-11  622      const BYTE* ip = istart;
e0c1b49f5b674c Nick Terrell 2020-09-11  623      const BYTE* anchor = istart;
e0c1b49f5b674c Nick Terrell 2020-09-11  624      const BYTE* const iend = istart + srcSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  625      const BYTE* const ilimit = iend - 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  626      const BYTE* const base = ms->window.base;
e0c1b49f5b674c Nick Terrell 2020-09-11  627      const U32   endIndex = (U32)((size_t)(istart - base) + srcSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  628      const U32   lowLimit = ZSTD_getLowestMatchIndex(ms, endIndex, cParams->windowLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  629      const U32   dictStartIndex = lowLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  630      const U32   dictLimit = ms->window.dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  631      const U32   prefixStartIndex = (dictLimit > lowLimit) ? dictLimit : lowLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  632      const BYTE* const prefixStart = base + prefixStartIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  633      const BYTE* const dictBase = ms->window.dictBase;
e0c1b49f5b674c Nick Terrell 2020-09-11  634      const BYTE* const dictStart = dictBase + dictStartIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  635      const BYTE* const dictEnd = dictBase + prefixStartIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  636      U32 offset_1=rep[0], offset_2=rep[1];
e0c1b49f5b674c Nick Terrell 2020-09-11  637  
e0c1b49f5b674c Nick Terrell 2020-09-11  638      DEBUGLOG(5, "ZSTD_compressBlock_doubleFast_extDict_generic (srcSize=%zu)", srcSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  639  
e0c1b49f5b674c Nick Terrell 2020-09-11  640      /* if extDict is invalidated due to maxDistance, switch to "regular" variant */
e0c1b49f5b674c Nick Terrell 2020-09-11  641      if (prefixStartIndex == dictStartIndex)
2aa14b1ab2c41a Nick Terrell 2022-10-17  642          return ZSTD_compressBlock_doubleFast(ms, seqStore, rep, src, srcSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  643  
e0c1b49f5b674c Nick Terrell 2020-09-11  644      /* Search Loop */
e0c1b49f5b674c Nick Terrell 2020-09-11  645      while (ip < ilimit) {  /* < instead of <=, because (ip+1) */
e0c1b49f5b674c Nick Terrell 2020-09-11  646          const size_t hSmall = ZSTD_hashPtr(ip, hBitsS, mls);
e0c1b49f5b674c Nick Terrell 2020-09-11  647          const U32 matchIndex = hashSmall[hSmall];
e0c1b49f5b674c Nick Terrell 2020-09-11  648          const BYTE* const matchBase = matchIndex < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  649          const BYTE* match = matchBase + matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  650  
e0c1b49f5b674c Nick Terrell 2020-09-11  651          const size_t hLong = ZSTD_hashPtr(ip, hBitsL, 8);
e0c1b49f5b674c Nick Terrell 2020-09-11  652          const U32 matchLongIndex = hashLong[hLong];
e0c1b49f5b674c Nick Terrell 2020-09-11  653          const BYTE* const matchLongBase = matchLongIndex < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  654          const BYTE* matchLong = matchLongBase + matchLongIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  655  
e0c1b49f5b674c Nick Terrell 2020-09-11  656          const U32 curr = (U32)(ip-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  657          const U32 repIndex = curr + 1 - offset_1;   /* offset_1 expected <= curr +1 */
e0c1b49f5b674c Nick Terrell 2020-09-11  658          const BYTE* const repBase = repIndex < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  659          const BYTE* const repMatch = repBase + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  660          size_t mLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  661          hashSmall[hSmall] = hashLong[hLong] = curr;   /* update hash table */
e0c1b49f5b674c Nick Terrell 2020-09-11  662  
65d1f5507ed2c7 Nick Terrell 2025-03-08  663          if (((ZSTD_index_overlap_check(prefixStartIndex, repIndex))
2aa14b1ab2c41a Nick Terrell 2022-10-17 @664              & (offset_1 <= curr+1 - dictStartIndex)) /* note: we are searching at curr+1 */
e0c1b49f5b674c Nick Terrell 2020-09-11  665            && (MEM_read32(repMatch) == MEM_read32(ip+1)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  666              const BYTE* repMatchEnd = repIndex < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  667              mLength = ZSTD_count_2segments(ip+1+4, repMatch+4, iend, repMatchEnd, prefixStart) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  668              ip++;
65d1f5507ed2c7 Nick Terrell 2025-03-08  669              ZSTD_storeSeq(seqStore, (size_t)(ip-anchor), anchor, iend, REPCODE1_TO_OFFBASE, mLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  670          } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  671              if ((matchLongIndex > dictStartIndex) && (MEM_read64(matchLong) == MEM_read64(ip))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  672                  const BYTE* const matchEnd = matchLongIndex < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  673                  const BYTE* const lowMatchPtr = matchLongIndex < prefixStartIndex ? dictStart : prefixStart;
e0c1b49f5b674c Nick Terrell 2020-09-11  674                  U32 offset;
e0c1b49f5b674c Nick Terrell 2020-09-11  675                  mLength = ZSTD_count_2segments(ip+8, matchLong+8, iend, matchEnd, prefixStart) + 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  676                  offset = curr - matchLongIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  677                  while (((ip>anchor) & (matchLong>lowMatchPtr)) && (ip[-1] == matchLong[-1])) { ip--; matchLong--; mLength++; }   /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  678                  offset_2 = offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  679                  offset_1 = offset;
65d1f5507ed2c7 Nick Terrell 2025-03-08  680                  ZSTD_storeSeq(seqStore, (size_t)(ip-anchor), anchor, iend, OFFSET_TO_OFFBASE(offset), mLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  681  
e0c1b49f5b674c Nick Terrell 2020-09-11  682              } else if ((matchIndex > dictStartIndex) && (MEM_read32(match) == MEM_read32(ip))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  683                  size_t const h3 = ZSTD_hashPtr(ip+1, hBitsL, 8);
e0c1b49f5b674c Nick Terrell 2020-09-11  684                  U32 const matchIndex3 = hashLong[h3];
e0c1b49f5b674c Nick Terrell 2020-09-11  685                  const BYTE* const match3Base = matchIndex3 < prefixStartIndex ? dictBase : base;
e0c1b49f5b674c Nick Terrell 2020-09-11  686                  const BYTE* match3 = match3Base + matchIndex3;
e0c1b49f5b674c Nick Terrell 2020-09-11  687                  U32 offset;
e0c1b49f5b674c Nick Terrell 2020-09-11  688                  hashLong[h3] = curr + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  689                  if ( (matchIndex3 > dictStartIndex) && (MEM_read64(match3) == MEM_read64(ip+1)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  690                      const BYTE* const matchEnd = matchIndex3 < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  691                      const BYTE* const lowMatchPtr = matchIndex3 < prefixStartIndex ? dictStart : prefixStart;
e0c1b49f5b674c Nick Terrell 2020-09-11  692                      mLength = ZSTD_count_2segments(ip+9, match3+8, iend, matchEnd, prefixStart) + 8;
e0c1b49f5b674c Nick Terrell 2020-09-11  693                      ip++;
e0c1b49f5b674c Nick Terrell 2020-09-11  694                      offset = curr+1 - matchIndex3;
e0c1b49f5b674c Nick Terrell 2020-09-11  695                      while (((ip>anchor) & (match3>lowMatchPtr)) && (ip[-1] == match3[-1])) { ip--; match3--; mLength++; } /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  696                  } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  697                      const BYTE* const matchEnd = matchIndex < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  698                      const BYTE* const lowMatchPtr = matchIndex < prefixStartIndex ? dictStart : prefixStart;
e0c1b49f5b674c Nick Terrell 2020-09-11  699                      mLength = ZSTD_count_2segments(ip+4, match+4, iend, matchEnd, prefixStart) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  700                      offset = curr - matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  701                      while (((ip>anchor) & (match>lowMatchPtr)) && (ip[-1] == match[-1])) { ip--; match--; mLength++; }   /* catch up */
e0c1b49f5b674c Nick Terrell 2020-09-11  702                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  703                  offset_2 = offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  704                  offset_1 = offset;
65d1f5507ed2c7 Nick Terrell 2025-03-08  705                  ZSTD_storeSeq(seqStore, (size_t)(ip-anchor), anchor, iend, OFFSET_TO_OFFBASE(offset), mLength);
e0c1b49f5b674c Nick Terrell 2020-09-11  706  
e0c1b49f5b674c Nick Terrell 2020-09-11  707              } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  708                  ip += ((ip-anchor) >> kSearchStrength) + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  709                  continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  710          }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  711  
e0c1b49f5b674c Nick Terrell 2020-09-11  712          /* move to next sequence start */
e0c1b49f5b674c Nick Terrell 2020-09-11  713          ip += mLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  714          anchor = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  715  
e0c1b49f5b674c Nick Terrell 2020-09-11  716          if (ip <= ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11  717              /* Complementary insertion */
e0c1b49f5b674c Nick Terrell 2020-09-11  718              /* done after iLimit test, as candidates could be > iend-8 */
e0c1b49f5b674c Nick Terrell 2020-09-11  719              {   U32 const indexToInsert = curr+2;
e0c1b49f5b674c Nick Terrell 2020-09-11  720                  hashLong[ZSTD_hashPtr(base+indexToInsert, hBitsL, 8)] = indexToInsert;
e0c1b49f5b674c Nick Terrell 2020-09-11  721                  hashLong[ZSTD_hashPtr(ip-2, hBitsL, 8)] = (U32)(ip-2-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  722                  hashSmall[ZSTD_hashPtr(base+indexToInsert, hBitsS, mls)] = indexToInsert;
e0c1b49f5b674c Nick Terrell 2020-09-11  723                  hashSmall[ZSTD_hashPtr(ip-1, hBitsS, mls)] = (U32)(ip-1-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  724              }
e0c1b49f5b674c Nick Terrell 2020-09-11  725  
e0c1b49f5b674c Nick Terrell 2020-09-11  726              /* check immediate repcode */
e0c1b49f5b674c Nick Terrell 2020-09-11  727              while (ip <= ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11  728                  U32 const current2 = (U32)(ip-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  729                  U32 const repIndex2 = current2 - offset_2;
e0c1b49f5b674c Nick Terrell 2020-09-11  730                  const BYTE* repMatch2 = repIndex2 < prefixStartIndex ? dictBase + repIndex2 : base + repIndex2;
65d1f5507ed2c7 Nick Terrell 2025-03-08  731                  if ( ((ZSTD_index_overlap_check(prefixStartIndex, repIndex2))
2aa14b1ab2c41a Nick Terrell 2022-10-17  732                      & (offset_2 <= current2 - dictStartIndex))
e0c1b49f5b674c Nick Terrell 2020-09-11  733                    && (MEM_read32(repMatch2) == MEM_read32(ip)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  734                      const BYTE* const repEnd2 = repIndex2 < prefixStartIndex ? dictEnd : iend;
e0c1b49f5b674c Nick Terrell 2020-09-11  735                      size_t const repLength2 = ZSTD_count_2segments(ip+4, repMatch2+4, iend, repEnd2, prefixStart) + 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  736                      U32 const tmpOffset = offset_2; offset_2 = offset_1; offset_1 = tmpOffset;   /* swap offset_2 <=> offset_1 */
65d1f5507ed2c7 Nick Terrell 2025-03-08  737                      ZSTD_storeSeq(seqStore, 0, anchor, iend, REPCODE1_TO_OFFBASE, repLength2);
e0c1b49f5b674c Nick Terrell 2020-09-11  738                      hashSmall[ZSTD_hashPtr(ip, hBitsS, mls)] = current2;
e0c1b49f5b674c Nick Terrell 2020-09-11  739                      hashLong[ZSTD_hashPtr(ip, hBitsL, 8)] = current2;
e0c1b49f5b674c Nick Terrell 2020-09-11  740                      ip += repLength2;
e0c1b49f5b674c Nick Terrell 2020-09-11  741                      anchor = ip;
e0c1b49f5b674c Nick Terrell 2020-09-11  742                      continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  743                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  744                  break;
e0c1b49f5b674c Nick Terrell 2020-09-11  745      }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  746  
e0c1b49f5b674c Nick Terrell 2020-09-11  747      /* save reps for next block */
e0c1b49f5b674c Nick Terrell 2020-09-11  748      rep[0] = offset_1;
e0c1b49f5b674c Nick Terrell 2020-09-11  749      rep[1] = offset_2;
e0c1b49f5b674c Nick Terrell 2020-09-11  750  
e0c1b49f5b674c Nick Terrell 2020-09-11  751      /* Return the last literals size */
e0c1b49f5b674c Nick Terrell 2020-09-11  752      return (size_t)(iend - anchor);
e0c1b49f5b674c Nick Terrell 2020-09-11  753  }
e0c1b49f5b674c Nick Terrell 2020-09-11  754  

:::::: The code at line 664 was first introduced by commit
:::::: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f zstd: import usptream v1.5.2

:::::: TO: Nick Terrell <terrelln@fb.com>
:::::: CC: Nick Terrell <terrelln@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
